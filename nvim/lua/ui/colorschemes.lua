require("tokyonight").setup({
	transparent = true,
	styles = {
		sidebars = "transparent",
		floats = "transparent",
	},
})

vim.cmd.colorscheme("tokyonight-night")
vim.api.nvim_set_hl(0, "Comment", {
	fg = "#E0AF68", -- brighter color
})

-- Line numbers
vim.api.nvim_set_hl(0, "CursorLineNr", {
	fg = "#FFFFFF",
	bold = true,
})

vim.api.nvim_set_hl(0, "LineNrAbove", {
	fg = "#A9B1D6",
})

vim.api.nvim_set_hl(0, "LineNr", {
	fg = "#C0CAF5",
})

vim.api.nvim_set_hl(0, "LineNrBelow", {
	fg = "#A9B1D6",
})
--vim.cmd.colorscheme("monokai-pro")
