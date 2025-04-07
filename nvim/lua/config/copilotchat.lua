require("CopilotChat").setup({})

vim.keymap.set("n", "<leader>cc", "<CMD>CopilotChatToggle<CR>", { desc = "Toggle Copilot Chat" })
vim.keymap.set("n", "<leader>cm", "<CMD>CopilotChatModels<CR>", { desc = "Change Copilot Models" })
