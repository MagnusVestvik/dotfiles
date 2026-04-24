vim.diagnostic.config({
	virtual_text = {
		prefix = "●",
	},
	severity_sort = true,
	signs = false,
	-- add this again to be able to see signs in gutterline
	--signs = {
	--	text = {
	--		[vim.diagnostic.severity.ERROR] = "",
	--		[vim.diagnostic.severity.WARN] = "",
	--		[vim.diagnostic.severity.INFO] = "",
	--		[vim.diagnostic.severity.HINT] = "",
	--	},
	--},
})

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
require("nvim-treesitter").setup({
	-- List of languages to ensure parsers are installed for
	ensure_installed = { "c", "lua", "go", "java" }, -- Add languages you use
	-- Automatically install missing parsers
	auto_install = true,
	-- Enable Treesitter features
	highlight = { enable = true }, -- Enables syntax highlighting
	indent = { enable = true }, -- Enables smart indentation
	-- Other optional modules like incremental_selection, textobjects, etc.
	-- You can enable these as needed.
})

vim.lsp.enable("lua_ls")
vim.lsp.enable("gopls")
-- inlay hints
vim.api.nvim_create_autocmd({ "BufEnter", }, {
	callback = function()
		vim.lsp.inlay_hint.enable()
	end,
})

-- get rid of annoying Undefined global `vim`
vim.lsp.config('lua_ls', {
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using
				-- (most likely LuaJIT in the case of Neovim)
				version = 'LuaJIT',
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = {
					'vim',
					'require'
				},
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
})


require("snacks").setup({
	picker = {
		ui_select = true,
	},
})

-- auto format code TODO: should remove this from the jdtls
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('my.lsp', {}),
	callback = function(ev)
		local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
		if client:supports_method('textDocument/implementation') then
			-- Create a keymap for vim.lsp.buf.implementation ...
		end
		-- Enable auto-completion. Note: Use CTRL-Y to select an item. |complete_CTRL-Y|
		if client:supports_method('textDocument/completion') then
			-- Optional: trigger autocompletion on EVERY keypress. May be slow!
			-- local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
			-- client.server_capabilities.completionProvider.triggerCharacters = chars
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end
		-- Auto-format ("lint") on save.
		-- Usually not needed if server supports "textDocument/willSaveWaitUntil".
		if not client:supports_method('textDocument/willSaveWaitUntil')
		    and client:supports_method('textDocument/formatting') then
			vim.api.nvim_create_autocmd('BufWritePre', {
				group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
				buffer = ev.buf,
				callback = function()
					vim.lsp.buf.format({ bufnr = ev.buf, id = client.id, timeout_ms = 1000 })
				end,
			})
		end
	end,
})

-- linting
require('sonarqube').setup({})
