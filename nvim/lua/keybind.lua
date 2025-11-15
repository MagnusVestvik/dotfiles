local vim    = vim
local jdtls  = require('jdtls')
local fzflua = require('fzf-lua')
local snacks = require('snacks')

-- General
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>")
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>")
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>")
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>")
vim.keymap.set("n", "<A-l>", ":bnext<CR>", { silent = true })

vim.api.nvim_set_keymap("n", "gh", "^", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gl", "$", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "gh", "^", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "gl", "$", { noremap = true, silent = true })

-- Utilities
vim.keymap.set("n", "<leader>km", snacks.picker.keymaps, { desc = "[k]ey [m]aps" })
vim.keymap.set("n", "<leader>i", snacks.picker.icons, { desc = "[i]cons" })
vim.keymap.set("n", "<leader>rg", snacks.picker.grep, { desc = "[r]ip [g]rep" })
vim.keymap.set("n", "<leader>ql", snacks.picker.qflist, { desc = "[q]uickfix [l]ist" })
vim.keymap.set("n", "<leader>m", snacks.picker.marks, { desc = "[m]arks" })
vim.keymap.set("n", "<leader>uh", snacks.picker.undo, { desc = "[u]ndo [h]istory" })
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set("n", "<leader>z", fzflua.zoxide, { desc = "fzf-lua: zoxide" })
vim.keymap.set("n", "<leader>gb", fzflua.git_branches, { desc = "List git branches" })
vim.keymap.set("n", "<leader>ldc", fzflua.dap_commands, { desc = "List dap commands" })
vim.keymap.set("n", "<leader>bl", fzflua.git_blame, { desc = "Blame line" })
vim.keymap.set("n", "<C-e>", fzflua.marks, { desc = "List marks" })
vim.keymap.set("n", "<leader>gs", fzflua.grep_cword, { desc = "Grep for word under cursor" })
vim.keymap.set("v", "<leader>gs", fzflua.grep_visual, { desc = "Grep for word under cursor" })

-- LSP keymaps
vim.keymap.set("n", "<leader>gd", snacks.picker.lsp_definitions, { desc = "[g]oto [d]efinition" })
vim.keymap.set("n", "<leader>gr", snacks.picker.lsp_references, { desc = "[g]oto [r]eferences" })
vim.keymap.set("n", "<leader>gi", snacks.picker.lsp_implementations, { desc = "[g]oto [i]mplementation" })
vim.keymap.set("n", "<leader>gs", snacks.picker.lsp_symbols, { desc = "[g]oto [s]ymbols" })
vim.keymap.set("n", "<leader>ca", fzflua.lsp_code_actions, { desc = "[c]ode [a]ctions" })
vim.api.nvim_set_keymap("n", "D", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename under cursor" })

-- Git keymaps
vim.keymap.set("n", "<C-g>b", snacks.picker.git_branches, { desc = "[g]it [b]ranches" })
vim.keymap.set("n", "<C-g>l", snacks.picker.git_log, { desc = "[g]it [l]og" })
vim.keymap.set("n", "<C-g>d", snacks.picker.git_diff, { desc = "[g]it [d]iff" })
vim.keymap.set("n", "<C-g>i", snacks.picker.gh_pr, { desc = "[g]it [p]ull request (see all pull requests)" })
vim.keymap.set("n", "<C-g>s", snacks.picker.git_stash, { desc = "[g]it [s]tash" })

-- Java keymaps
vim.keymap.set("n", "<leader>tc", jdtls.test_class, { desc = "Test class" })
vim.keymap.set("n", "<leader>tm", jdtls.test_nearest_method, { desc = "Test nearest method" })
