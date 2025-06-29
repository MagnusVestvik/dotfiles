return {
	"kristijanhusak/vim-dadbod-ui",
	dependencies = {
		{ "tpope/vim-dadbod", lazy = true },
		{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
	},
	cmd = {
		"DBUI",
		"DBUIToggle",
		"DBUIAddConnection",
		"DBUIFindBuffer",
	},
	init = function()
		vim.g.db_ui_use_nerd_fonts = 1

		-- Try with 127.0.0.1 instead of localhost
		vim.g.dbs = {
			voddb = "mysql://root:test@127.0.0.1:3307/voddb",
		}

		-- Enable debug logging
		vim.g.db_ui_debug = 1
	end,
}
