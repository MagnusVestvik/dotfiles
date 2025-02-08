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
-- setup must be called before loading
