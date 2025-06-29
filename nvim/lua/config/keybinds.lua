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
vim.keymap.set("n", "<leader>cm", ":CopilotChatModels<CR>")

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
--vim.keymap.set("n", "<leader>rg", builtin.live_grep, { desc = "Grep for string" })
--vim.keymap.set("v", "<leader>rg", builtin.live_grep, { desc = "Grep for string" })
vim.keymap.set("n", "<leader>gs", builtin.grep_string, { desc = "Grep for string under cursor" })
vim.keymap.set("v", "<leader>gs", builtin.grep_string, { desc = "Grep for string under cursor" })
vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "List buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Search help tags" })
vim.keymap.set("n", "<leader>da", builtin.diagnostics, { desc = "List diagnostics" })

-- Dap ui
vim.keymap.set("n", "<leader>du", ':lua require"dapui".toggle()<CR>', { desc = "Toggle Dap UI" })

-- JDTLS stuff TODO: tror dette er fra gamme config
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

vim.keymap.set("n", "<leader>jt", function()
	if vim.bo.filetype == "java" then
		require("java").profile.ui()
	end
end, { desc = "Run test class" })

-- Select previously pasted text
vim.keymap.set("n", "gp", "`[v`]", { desc = "Select previously pasted text" })

-- Java keymaps
vim.keymap.set("n", "<leader>tc", function()
	if vim.bo.filetype == "java" then
		require("java").test.debug_current_class()
	end
end, { desc = "Debug test class" })

vim.keymap.set("n", "<leader>tm", function()
	if vim.bo.filetype == "java" then
		require("java").test.debug_current_method()
	end
end, { desc = "Debug current test method" })

vim.keymap.set("n", "<leader>tr", function()
	if vim.bo.filetype == "java" then
		require("java").test.view_last_report()
	end
end, { desc = "View last test report" })

vim.keymap.set("n", "<leader>tr", function()
	if vim.bo.filetype == "java" then
		require("java").test.view_last_report()
	end
end, { desc = "View last test report" })

vim.keymap.set("n", "<leader>bp", function()
	if vim.bo.filetype == "java" then
		require("java").build.build_workspace()
	end
end, { desc = "Build Java project" })

vim.keymap.set("v", "<leader>rm", function()
	if vim.bo.filetype == "java" then
		require("java").refactor.extract_method()
	end
end, { desc = "Extract method" })

vim.keymap.set({ "n", "v" }, "<leader>rv", function()
	if vim.bo.filetype == "java" then
		require("java").refactor.extract_variable()
	end
end, { desc = "Extract variable" })

vim.keymap.set({ "n", "v" }, "<leader>rva", function()
	if vim.bo.filetype == "java" then
		require("java").refactor.extract_variable_all_occurrence()
	end
end, { desc = "Extract variable all occurence" })

vim.keymap.set({ "n", "v" }, "<leader>rf", function()
	if vim.bo.filetype == "java" then
		require("java").refactor.extract_field()
	end
end, { desc = "Extract field" })

require("nvim-treesitter.configs").setup({
	textobjects = {
		swap = {
			enable = true,
			swap_next = {
				["<leader>a"] = "@parameter.inner",
			},
			swap_previous = {
				["<leader>A"] = "@parameter.inner",
			},
		},
	},
})
