-- Go to end of file in normal mode
vim.api.nvim_set_keymap("n", "ge", ":$<CR>", { noremap = true, silent = true })

-- Go to start of line in normal mode
vim.api.nvim_set_keymap("n", "gh", "^", { noremap = true, silent = true })

-- Go to end of line in normal mode
vim.api.nvim_set_keymap("n", "gl", "$", { noremap = true, silent = true })

-- Go to start of line in visual mode
vim.api.nvim_set_keymap("v", "gh", "^", { noremap = true, silent = true })

-- go to end of line in visual mode
vim.api.nvim_set_keymap("v", "gl", "$", { noremap = true, silent = true })

-- LazyGit
vim.keymap.set("n", "<leader>lg", ":LazyGit<CR>")

-- CopilotChat
vim.keymap.set("n", "<leader>cc", ":CopilotChatToggle<CR>")

-- Fold code
vim.api.nvim_set_keymap("v", "fc", "zf", { noremap = true, silent = true })

-- Refactor code
vim.keymap.set("x", "<leader>re", ":Refactor extract ")
vim.keymap.set("x", "<leader>rf", ":Refactor extract_to_file ")

vim.keymap.set("x", "<leader>rv", ":Refactor extract_var ")

vim.keymap.set({ "n", "x" }, "<leader>ri", ":Refactor inline_var")

vim.keymap.set("n", "<leader>rI", ":Refactor inline_func")

vim.keymap.set("n", "<leader>rb", ":Refactor extract_block")
vim.keymap.set("n", "<leader>rbf", ":Refactor extract_block_to_file")
--

-- Refactor keymaps
vim.keymap.set("x", "<leader>re", function()
	require("refactoring").refactor("Extract Function")
end)
vim.keymap.set("x", "<leader>rf", function()
	require("refactoring").refactor("Extract Function To File")
end)
-- Extract function supports only visual mode
vim.keymap.set("x", "<leader>rv", function()
	require("refactoring").refactor("Extract Variable")
end)
-- Extract variable supports only visual mode
vim.keymap.set("n", "<leader>rI", function()
	require("refactoring").refactor("Inline Function")
end)
-- Inline func supports only normal
vim.keymap.set({ "n", "x" }, "<leader>rn", function()
	require("refactoring").refactor("Inline Variable")
end)
-- Inline var supports both normal and visual mode

vim.keymap.set("n", "<leader>rb", function()
	require("refactoring").refactor("Extract Block")
end)
vim.keymap.set("n", "<leader>rbf", function()
	require("refactoring").refactor("Extract Block To File")
end)
-- Extract block supports only normal mode
--
-- using the command
vim.api.nvim_set_keymap("n", "<leader>z", "<cmd>Centerpad<cr>", { silent = true, noremap = true })

-- or using the lua function
vim.api.nvim_set_keymap(
	"n",
	"<leader>z",
	"<cmd>lua require'centerpad'.toggle{ leftpad = 20, rightpad = 20 }<cr>",
	{ silent = true, noremap = true }
)

-- Open parent directory with Oil
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Perform live grep with Telescope

vim.api.nvim_set_keymap(
	"n",
	"<leader>fg",
	"<cmd>lua require('telescope.builtin').live_grep()<CR>",
	{ noremap = true, silent = true }
)

-- Telescope keybinds
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>,", builtin.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>rg", builtin.live_grep, { desc = "Grep for string" })
vim.keymap.set("v", "<leader>rg", builtin.live_grep, { desc = "Grep for string" })
vim.keymap.set("n", "<leader>gs", builtin.grep_string, { desc = "Grep for string under cursor" })
vim.keymap.set("v", "<leader>gs", builtin.grep_string, { desc = "Grep for string under cursor" })
vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "List buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Search help tags" })
vim.keymap.set("n", "<leader>da", builtin.diagnostics, { desc = "List diagnostics" })

-- Dap ui
vim.keymap.set("n", "<leader>du", ':lua require"dapui".toggle()<CR>', { desc = "Toggle Dap UI" })

-- JDTLS stuff
vim.keymap.set("n", "<leader>df", function()
	require("jdtls").test_class()
end, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>dn", function()
	require("jdtls").test_nearest_method()
end, { noremap = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- lsp keymaps
vim.api.nvim_set_keymap("n", "D", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>tc", function()
	if vim.bo.filetype == "java" then
		require("jdtls").test_class()
	end
end, { desc = "Run test class" })

vim.keymap.set("n", "<leader>tm", function()
	if vim.bo.filetype == "java" then
		require("jdtls").test_nearest_method()
	end
end, { desc = "Run nearest test method" })
