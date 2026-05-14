-- Smooth transparent colorscheme
--require("tokyonight").setup({
--	transparent = true,
--	styles = {
--		sidebars = "transparent",
--		floats = "transparent",
--	},
--	integrations = {
--		blink_cmp = true,
--	},
--})
--
--vim.cmd.colorscheme("tokyonight-night")
--vim.api.nvim_set_hl(0, "Comment", {
--	fg = "#E0AF68", -- brighter color
--})
--
---- Line numbers
--vim.api.nvim_set_hl(0, "CursorLineNr", {
--	fg = "#FFFFFF",
--	bold = true,
--})
--
--vim.api.nvim_set_hl(0, "LineNrAbove", {
--	fg = "#A9B1D6",
--})
--
--vim.api.nvim_set_hl(0, "LineNr", {
--	fg = "#C0CAF5",
--})
--
--vim.api.nvim_set_hl(0, "LineNrBelow", {
--	fg = "#A9B1D6",
--})
require("solarized-osaka").setup({
	transparent = true,
	on_highlights = function(hl, c)
		local prompt = "#2d3149"
		hl.TelescopeNormal = {
			bg = c.bg_dark,
			fg = c.fg_dark,
		}
		hl.TelescopeBorder = {
			bg = c.bg_dark,
			fg = c.bg_dark,
		}
		hl.TelescopePromptNormal = {
			bg = prompt,
		}
		hl.TelescopePromptBorder = {
			bg = prompt,
			fg = prompt,
		}
		hl.TelescopePromptTitle = {
			bg = prompt,
			fg = prompt,
		}
		hl.TelescopePreviewTitle = {
			bg = c.bg_dark,
			fg = c.bg_dark,
		}
		hl.TelescopeResultsTitle = {
			bg = c.bg_dark,
			fg = c.bg_dark,
		}
	end,
})
vim.cmd [[colorscheme solarized-osaka]]
