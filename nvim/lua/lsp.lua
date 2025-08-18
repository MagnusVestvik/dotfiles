vim.fn.sign_define('DiagnosticSignError',
    { text = '', texthl = 'DiagnosticSignError', numhl = '' })
vim.fn.sign_define('DiagnosticSignWarn',
    { text = '', texthl = 'DiagnosticSignWarn', numhl = '' })
vim.fn.sign_define('DiagnosticSignInfo',
    { text = '', texthl = 'DiagnosticSignInfo', numhl = '' })
vim.fn.sign_define('DiagnosticSignHint',
    { text = '>>', texthl = 'DiagnosticSignHint', numhl = '' })

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
