vim.opt.clipboard:append("unnamedplus")
vim.wo.number = true
vim.wo.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.autoindent = true

vim.g.copilot_enabled = false -- Disable copilot by default
vim.g.copilot_no_tab_map = true

-- Function to enable copilot
local function enable_copilot()
	vim.g.copilot_enabled = true
	vim.cmd('Copilot enable')
	print('Copilot enabled - God Speed!')
end

-- Function to disable copilot
local function disable_copilot()
	vim.g.copilot_enabled = false
	vim.cmd('Copilot disable')
	print('Copilot disabled')
end

-- Create the godSpeed function to toggle copilot
function _G.godSpeed()
	if vim.g.copilot_enabled then
		disable_copilot()
	else
		enable_copilot()
	end
end

-- Create a command to call godSpeed
vim.api.nvim_create_user_command('GodSpeed', function()
	_G.godSpeed()
end, {})
-- Default options:
require('kanagawa').setup({
	compile = false, -- enable compiling the colorscheme
	undercurl = true, -- enable undercurls
	commentStyle = { italic = true },
	functionStyle = {},
	keywordStyle = { italic = true },
	statementStyle = { bold = true },
	typeStyle = {},
	transparent = true, -- do not set background color
	dimInactive = true, -- dim inactive window `:h hl-NormalNC`
	terminalColors = true, -- define vim.g.terminal_color_{0,17}
	colors = {          -- add/modify theme and palette colors
		palette = {},
		theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
	},
	overrides = function(colors) -- add/modify highlights
		return {}
	end,
	theme = "wave", -- Load "wave" theme when 'background' option is not set
	background = { -- map the value of 'background' option to a theme
		dark = "wave", -- try "dragon" !
		light = "lotus"
	},
})

-- setup must be called before loading
vim.cmd("colorscheme kanagawa")
