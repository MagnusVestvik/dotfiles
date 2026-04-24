local tiny_diag = require("tiny-inline-diagnostic")

tiny_diag.setup({
	preset = "modern",
	options = {
		add_messages = {
			display_count = true,
		},
		multilines = {
			enabled = true,
		},
		-- optional:
		-- show_all_diags_on_cursorline = true,
	},
})

vim.diagnostic.config({ virtual_text = false })
