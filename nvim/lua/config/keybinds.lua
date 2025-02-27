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

-- ZenMode
vim.api.nvim_set_keymap('n', '<leader>z', "<cmd>lua require'centerpad'.toggle{ leftpad = 20, rightpad = 20 }<cr>",
	{ silent = true, noremap = true, desc = 'Enter Zen mode' })

-- Oil
vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>,', builtin.find_files, { desc = 'Find Files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Search through project for specified string' })
vim.keymap.set('n', '<leader>gs', builtin.grep_string, { desc = 'Search for string under cursor' })
vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = 'List open buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Search help tags' })
vim.keymap.set('n', '<leader>mp', builtin.man_pages, { desc = 'Look through man pages' })
vim.keymap.set('n', '<leader>cs', builtin.colorscheme, { desc = 'Look through colorschemes' })
vim.keymap.set('n', '<leader>da', builtin.diagnostics, { desc = 'Diagnostics' })


-- Diagnostic keymaps
vim.keymap.set('n', '<leader>dp', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', '<leader>dn', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
