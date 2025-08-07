local fzflua = require("fzf-lua")
local vim = vim

vim.keymap.set("n", "<leader>z", fzflua.zoxide, { desc = "fzf-lua: zoxide" })
vim.keymap.set("n", "<leader>,", fzflua.files, { desc = "Find files" })
vim.keymap.set("n", "<leader>rg", fzflua.live_grep, { desc = "Grep for string" })
vim.keymap.set("v", "<leader>rg", fzflua.live_grep, { desc = "Grep for string" })
vim.keymap.set("n", "<leader>gb", fzflua.git_branches, { desc = "List git branches" })
vim.keymap.set("n", "<leader>ldc", fzflua.dap_commands, { desc = "List dap commands" })
vim.keymap.set("n", "<leader>bl", fzflua.git_blame, { desc = "Blame line" })
vim.keymap.set("n", "<C-e>", fzflua.marks, { desc = "List marks" })
vim.keymap.set("n", "<leader>gs", fzflua.grep_cword, { desc = "Grep for word under cursor" })
vim.keymap.set("v", "<leader>gs", fzflua.grep_visual, { desc = "Grep for word under cursor" })

-- Lsp keymaps
vim.keymap.set("n", "gd", fzflua.lsp_definitions, { desc = "[G]oto [D]efinition" })
vim.keymap.set("n", "gr", fzflua.lsp_references, { desc = "[G]oto [R]eferences" })
vim.keymap.set("n", "gI", fzflua.lsp_implementations, { desc = "[G]oto [I]mplementation" })
vim.keymap.set("n", "gi", fzflua.lsp_implementations, { desc = "[G]oto [I]mplementation" })
vim.keymap.set("n", "<leader>D", fzflua.lsp_typedefs, { desc = "Type [D]efinition" })
vim.keymap.set("n", "<leader>ca", fzflua.lsp_code_actions, { desc = "Code [A]ctions" })

fzflua.setup({
    winopts = {
        -- split = "belowright new",-- open in a split instead?
        -- "belowright new"  : split below
        -- "aboveleft new"   : split above
        -- "belowright vnew" : split right
        -- "aboveleft vnew   : split left
        -- Only valid when using a float window
        -- (i.e. when 'split' is not defined, default)
        height       = 0.85, -- window height
        width        = 0.80, -- window width
        row          = 0.35, -- window row position (0=top, 1=bottom)
        col          = 0.50, -- window col position (0=left, 1=right)
        winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder",
        -- border argument passthrough to nvim_open_win()
        border       = "rounded",
        -- Backdrop opacity, 0 is fully opaque, 100 is fully transparent (i.e. disabled)
        backdrop     = 0,
        -- title         = "Title",
        -- title_pos     = "center",        -- 'left', 'center' or 'right'
        -- title_flags   = false,           -- uncomment to disable title flags
        fullscreen   = false, -- start fullscreen?
        -- enable treesitter highlighting for the main fzf window will only have
        -- effect where grep like results are present, i.e. "file:line:col:text"
        -- due to highlight color collisions will also override `fzf_colors`
        -- set `fzf_colors=false` or `fzf_colors.hl=...` to override
        treesitter   = {
            enabled    = true,
            fzf_colors = { ["hl"] = "-1:reverse", ["hl+"] = "-1:reverse" }
        },
        preview      = {
            default      = 'bat',     -- override the default previewer?
            -- default uses the 'builtin' previewer
            border       = "rounded", -- preview border: accepts both `nvim_open_win`
            -- and fzf values (e.g. "border-top", "none")
            -- native fzf previewers (bat/cat/git/etc)
            -- can also be set to `fun(winopts, metadata)`
            wrap         = false,       -- preview line wrap (fzf's 'wrap|nowrap')
            hidden       = false,       -- start preview hidden
            vertical     = "down:45%",  -- up|down:size
            horizontal   = "right:60%", -- right|left:size
            layout       = "vertical",  -- horizontal|vertical|flex
            flip_columns = 100,         -- #cols to switch to horizontal on flex
            -- Only used with the builtin previewer:
            title        = true,        -- preview border title (file/buf)?
            title_pos    = "center",    -- left|center|right, title alignment
            scrollbar    = "float",     -- `false` or string:'float|border'
            -- float:  in-window floating border
            -- border: in-border "block" marker
            scrolloff    = -1, -- float scrollbar offset from right
            -- applies only when scrollbar = 'float'
            delay        = 20, -- delay(ms) displaying the preview
            -- prevents lag on fast scrolling
            winopts      = {   -- builtin previewer window options
                number         = true,
                relativenumber = true,
                cursorline     = true,
                cursorlineopt  = "both",
                cursorcolumn   = false,
                signcolumn     = "no",
                list           = true,
                foldenable     = false,
                foldmethod     = "manual",
                winhighlight   = "Normal:NormalFloat,FloatBorder:FloatBorder",
            },
        },
        on_create    = function()
            -- called once upon creation of the fzf main window
            -- can be used to add custom fzf-lua mappings, e.g:
            --   vim.keymap.set("t", "<C-j>", "<Down>", { silent = true, buffer = true })
        end,
        -- called once _after_ the fzf interface is closed
        -- on_close = function() ... end
    }
})
