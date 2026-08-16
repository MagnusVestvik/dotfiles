local vim = vim
-- Options
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.clipboard:append("unnamedplus")
vim.wo.number = true
vim.wo.relativenumber = true
vim.diagnostic.config({ virtual_text = true })

 vim.cmd 'colorscheme catppuccin'

-- Keybinds
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>")
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>")
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>")
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>")
vim.api.nvim_set_keymap("n", "gh", "^", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gl", "$", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "gh", "^", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "gl", "$", { noremap = true, silent = true })

vim.keymap.set("n", "-", "<cmd>Explore<CR>") 
vim.keymap.set("n", "nh", "<cmd>noh<CR>")


-- Lsp keymaps
vim.keymap.set("n", "gd", vim.lsp.buf.type_definition)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
vim.keymap.set("n", "rn", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>wd", vim.lsp.buf.workspace_diagnostics)
vim.keymap.set("n", "fb", vim.lsp.buf.format)

-- autocomplete options
vim.o.complete = ".,o" -- use buffer and omnifunc
vim.o.completeopt = "fuzzy,menuone,noselect" -- add 'popup' for docs (sometimes)
vim.o.autocomplete = true
vim.o.pumheight = 7
-- lsp setup
vim.lsp.config['emmylua_ls'] = {
	-- Command and arguments to start the server.
	cmd = { 'emmylua_ls' },
	-- Filetypes to automatically attach to.
	filetypes = { 'lua' },
	-- Sets the workspace "root" to the directory where any of these files is found.
	-- Files sharing a root will reuse the LSP client/connection.
	-- Nested lists indicate equal priority, see |vim.lsp.Config|.
	root_markers = { { '.emmyrc.json', '.luarc.json' }, '.git' },
	-- Server-specific settings. https://github.com/EmmyLuaLs/emmylua-analyzer-rust/blob/main/docs/config/emmyrc_json_EN.md
	settings = {
		runtime = {
			version = 'LuaJIT',
		}
	}
}

vim.lsp.enable("emmylua_ls")

vim.lsp.config["gopls"] = {
cmd = { 'gopls' },
	-- Filetypes to automatically attach to.
	filetypes = { 'go' },
	root_markers = {'.git'},
	-- Sets the workspace "root" to the directory where any of these files is found.
	-- Files sharing a root will reuse the LSP client/connection.
	-- Server-specific settings. https://github.com/EmmyLuaLs/emmylua-analyzer-rust/blob/main/docs/config/emmyrc_json_EN.md
}
vim.lsp.enable("gopls")

-- lsp completion see: [here](https://neovim.io/doc/user/lsp/#_lua-module:-vim.lsp.completion)
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    vim.lsp.completion.enable(true, ev.data.client_id, ev.buf, {
      -- Optional formating of items
      convert = function(item)
        -- Remove leading misc chars for abbr name,
        -- and cap field to 25 chars
        --local abbr = item.label
        --abbr = abbr:match("[%w_.]+.*") or abbr
        --abbr = #abbr > 25 and abbr:sub(1, 24) .. "…" or abbr
        --
        -- Remove return value
        --local menu = ""

        -- Only show abbr name, remove leading misc chars (bullets etc.),
        -- and cap field to 15 chars
        local abbr = item.label
        abbr = abbr:gsub("%b()", ""):gsub("%b{}", "")
        abbr = abbr:match("[%w_.]+.*") or abbr
        abbr = #abbr > 15 and abbr:sub(1, 14) .. "…" or abbr

        -- Cap return value field to 15 chars
        local menu = item.detail or ""
        menu = #menu > 15 and menu:sub(1, 14) .. "…" or menu

        return { abbr = abbr, menu = menu }
      end,
    })
  end,
})


vim.pack.add({
	"https://github.com/nvim-treesitter/nvim-treesitter"
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'go' },
  callback = function() vim.treesitter.start() end,
})
