return {
    'https://gitlab.com/schrieveslaach/sonarlint.nvim.git',
    main = 'sonarlint',
    enabled = true,
    event = "VeryLazy",
    ft = { "cpp" },
    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'neovim/nvim-lspconfig',
    },
    config = function()
        require('sonarlint').setup({
            server = {
                cmd = {
'sonarlint-language-server',
         -- Ensure that sonarlint-language-server uses stdio channel
         '-stdio',
         '-analyzers',
         -- paths to the analyzers you need, using those for python and java in this example
         vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarpython.jar"),
         vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarcfamily.jar"),
         vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarjava.jar"),
                }
            },
            filetypes = {
                -- Tested and working
                -- 'python',
                --'cpp',
                 'java',
            },
        })
 local function open_sonarlint_code_description()
      -- Create the autocommand group (clearing it if it already exists)
      -- It's okay to create it here because the autocmd is temporary (once=true)
      local user_augroup = vim.api.nvim_create_augroup("user", { clear = true })
      -- Consider using a more specific group name like "SonarLintHelper"
      -- local sonar_helper_augroup = vim.api.nvim_create_augroup("SonarLintHelper", { clear = true })

      vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
        callback = function(args)
          -- Make the buffer writable
          -- Use args.buf to target the buffer the event occurred in
          vim.api.nvim_buf_set_option(args.buf, "readonly", false)
          vim.api.nvim_buf_set_option(args.buf, "modifiable", true) -- Ensure it's modifiable too

          -- Execute pandoc in the correct buffer
          -- Use <afile> which refers to the buffer of the autocmd
          vim.cmd(args.buf .. "bufdo %!pandoc --from html --to markdown")

          -- Optional: Set filetype to markdown for syntax highlighting
          vim.api.nvim_buf_set_option(args.buf, "filetype", "markdown")
        end,
        -- Use the group ID or name. Using the ID is slightly preferred.
        group = user_augroup,
        -- group = "user", -- This also works now
        once = true,
        -- Apply only to the buffer created by the code action, if possible.
        -- Using pattern = "*" is broad, but might be necessary if the buffer
        -- name/type isn't predictable. The `once = true` helps limit it.
        pattern = "*",
        desc = "Convert SonarLint HTML description to Markdown",
      })

      -- Trigger the SonarLint code action to open the description
      vim.lsp.buf.code_action({
        apply = true,
        filter = function(action)
          return action.command and action.command.command ==
            "SonarLint.OpenRuleDescCodeAction"
        end,
      })
    end

    -- Create the user command
    vim.api.nvim_create_user_command(
      "SonarqubeDescriptionOpen",
      open_sonarlint_code_description,
      { desc = "Open SonarLint rule description and convert to Markdown" }
    )
  end
}
