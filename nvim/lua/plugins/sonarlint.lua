return {
	"https://gitlab.com/schrieveslaach/sonarlint.nvim.git",
	main = "sonarlint",
	enabled = true,
	event = "VeryLazy",
	ft = { "cpp" },
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	},
--	config = function()
--		require("sonarlint").setup({
--			server = {
--				cmd = {
--					"sonarlint-language-server",
--					-- Ensure that sonarlint-language-server uses stdio channel
--					"-stdio",
--					"-analyzers",
--					-- paths to the analyzers you need, using those for python and java in this example
--					vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarpython.jar"),
--					vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarcfamily.jar"),
--					vim.fn.expand("$MASON/share/sonarlint-analyzers/sonarjava.jar"),
--				},
--				on_attach = function(client, bufnr)
--					-- Check if the buffer is valid before proceeding
--					if not vim.api.nvim_buf_is_valid(bufnr) then
--						return
--					end
--					-- Any additional on_attach functionality can go here
--				end,
--			},
--			filetypes = {
--				-- Tested and working
--				-- 'python',
--				--'cpp',
--				"java",
--			},
--		})
--
--		-- The rest of your configuration remains the same
--		local function open_sonarlint_code_description()
--			-- Create the autocommand group (clearing it if it already exists)
--			local user_augroup = vim.api.nvim_create_augroup("user", { clear = true })
--
--			vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
--				callback = function(args)
--					-- Make sure the buffer is valid
--					if not vim.api.nvim_buf_is_valid(args.buf) then
--						return
--					end
--
--					-- Make the buffer writable
--					vim.api.nvim_buf_set_option(args.buf, "readonly", false)
--					vim.api.nvim_buf_set_option(args.buf, "modifiable", true)
--
--					-- Execute pandoc in the correct buffer
--					vim.cmd(args.buf .. "bufdo %!pandoc --from html --to markdown")
--
--					-- Optional: Set filetype to markdown for syntax highlighting
--					vim.api.nvim_buf_set_option(args.buf, "filetype", "markdown")
--				end,
--				group = user_augroup,
--				once = true,
--				pattern = "*",
--				desc = "Convert SonarLint HTML description to Markdown",
--			})
--
--			-- Trigger the SonarLint code action to open the description
--			vim.lsp.buf.code_action({
--				apply = true,
--				filter = function(action)
--					return action.command and action.command.command == "SonarLint.OpenRuleDescCodeAction"
--				end,
--			})
--		end
--
--		-- Create the user command
--		vim.api.nvim_create_user_command(
--			"SonarqubeDescriptionOpen",
--			open_sonarlint_code_description,
--			{ desc = "Open SonarLint rule description and convert to Markdown" }
--		)
--	end,
}
