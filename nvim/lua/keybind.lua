vim.keymap.set("n", "<leader><leader>", function()
  MiniPick.builtin.buffers()
end, { desc = "Find buffers" })

vim.keymap.set("n", "<leader>rg", function()
  MiniPick.builtin.grep_live()
end, { desc = "Find buffers" })


vim.api.nvim_set_keymap("n", "gh", "^", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gl", "$", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "gh", "^", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "gl", "$", { noremap = true, silent = true })

vim.keymap.set("n", "-", function()
	require("mini.files").open()
end, { desc = "Open parent directory" })

