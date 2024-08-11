-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local wk = require 'which-key'
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Go to end of file in normal mode
vim.api.nvim_set_keymap('n', 'ge', ':$<CR>', { noremap = true, silent = true })

-- Go to start of line in normal mode
vim.api.nvim_set_keymap('n', 'gh', '^', { noremap = true, silent = true })

-- Go to end of line in normal mode
vim.api.nvim_set_keymap('n', 'gl', '$', { noremap = true, silent = true })

-- Go to start of line in visual mode
vim.api.nvim_set_keymap('v', 'gh', '^', { noremap = true, silent = true })

-- go to end of line in visual mode
vim.api.nvim_set_keymap('v', 'gl', '$', { noremap = true, silent = true })

-- LazyGit
vim.keymap.set('n', '<leader>lg', ':LazyGit<CR>')

-- Fold code
vim.api.nvim_set_keymap('v', 'fc', 'zf', { noremap = true, silent = true })

-- Refactor code
vim.keymap.set('x', '<leader>re', ':Refactor extract ')
vim.keymap.set('x', '<leader>rf', ':Refactor extract_to_file ')

vim.keymap.set('x', '<leader>rv', ':Refactor extract_var ')

vim.keymap.set({ 'n', 'x' }, '<leader>ri', ':Refactor inline_var')

vim.keymap.set('n', '<leader>rI', ':Refactor inline_func')

vim.keymap.set('n', '<leader>rb', ':Refactor extract_block')
vim.keymap.set('n', '<leader>rbf', ':Refactor extract_block_to_file')
--

-- Refactor keymaps
vim.keymap.set('x', '<leader>re', function()
  require('refactoring').refactor 'Extract Function'
end)
vim.keymap.set('x', '<leader>rf', function()
  require('refactoring').refactor 'Extract Function To File'
end)
-- Extract function supports only visual mode
vim.keymap.set('x', '<leader>rv', function()
  require('refactoring').refactor 'Extract Variable'
end)
-- Extract variable supports only visual mode
vim.keymap.set('n', '<leader>rI', function()
  require('refactoring').refactor 'Inline Function'
end)
-- Inline func supports only normal
vim.keymap.set({ 'n', 'x' }, '<leader>rn', function()
  require('refactoring').refactor 'Inline Variable'
end)
-- Inline var supports both normal and visual mode

vim.keymap.set('n', '<leader>rb', function()
  require('refactoring').refactor 'Extract Block'
end)
vim.keymap.set('n', '<leader>rbf', function()
  require('refactoring').refactor 'Extract Block To File'
end)
-- Extract block supports only normal mode
--
-- using the command
vim.api.nvim_set_keymap('n', '<leader>z', '<cmd>Centerpad<cr>', { silent = true, noremap = true })

-- or using the lua function
vim.api.nvim_set_keymap('n', '<leader>z', "<cmd>lua require'centerpad'.toggle{ leftpad = 20, rightpad = 20 }<cr>", { silent = true, noremap = true })

-- Harpoon
local harpoon = require 'harpoon'

-- REQUIRED
harpoon:setup()
-- REQUIRED
--
--
-- Function to get Harpoon file name
local function get_harpoon_file(index)
  return harpoon:list():get(index).value
end
vim.keymap.set('n', '<leader>a', function()
  harpoon:list():add()
end)
vim.keymap.set('n', '<leader>dh', function()
  harpoon:list():clear()
end)
vim.keymap.set('n', '<C-e>', function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end)
vim.keymap.set('n', '<leader>h', function()
  harpoon:list():select(1)
end)
vim.keymap.set('n', '<leader>j', function()
  harpoon:list():select(2)
end)
vim.keymap.set('n', '<leader>k', function()
  harpoon:list():select(3)
end)
vim.keymap.set('n', '<leader>ll', function()
  harpoon:list():select(4)
end)
vim.keymap.set('n', '<leader>ø', function()
  harpoon:list():select(5)
end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set('n', '<leader>nb', function()
  harpoon:list():prev()
end)
vim.keymap.set('n', '<leader>pb', function()
  harpoon:list():next()
end)
-- Which-key registration

-- basic telescope configuration
local conf = require('telescope.config').values
local function toggle_telescope(harpoon_files)
  local file_paths = {}
  for _, item in ipairs(harpoon_files.items) do
    table.insert(file_paths, item.value)
  end

  require('telescope.pickers')
    .new({}, {
      prompt_title = 'Harpoon',
      finder = require('telescope.finders').new_table {
        results = file_paths,
      },
      previewer = conf.file_previewer {},
      sorter = conf.generic_sorter {},
    })
    :find()
end

vim.keymap.set('n', '<C-e>', function()
  toggle_telescope(harpoon:list())
end, { desc = 'Open harpoon window' })

-- Harpoon end
--
-- Open parent directory with Oil
vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

-- Perform live grep with Telescope

-- ~/.config/nvim/init.lua or ~/.config/nvim/lua/keybindings.lua
vim.api.nvim_set_keymap('n', '<leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<CR>", { noremap = true, silent = true })
