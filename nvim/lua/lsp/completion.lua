local blink = require("blink.cmp")

blink.setup({
	keymap = {
		preset = "default", -- or "super-tab", "none"
	},
	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},
	completion = {
		documentation = { auto_show = true },
		ghost_text = { enabled = true },
		list = {
			selection = {
				preselect = false,
				auto_insert = false,
			},
		},
	},
})
vim.opt.completeopt = { "menu", "menuone", "noselect", "noinsert" }
