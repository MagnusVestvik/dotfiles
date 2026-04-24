local snacks = require('snacks')
local jdtls  = require('jdtls')
local neogit = require('neogit')
local cchat  = require('CopilotChat')

-- General
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>")
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>")
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>")
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>")
vim.api.nvim_set_keymap("n", "gh", "^", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gl", "$", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "gh", "^", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "gl", "$", { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", "<cmd>tabnext<CR>", { desc = "move to next tab" })
vim.keymap.set("n", "<C-h>", "<cmd>tabprevious<CR>", { desc = "move to previous tab" })

-- Utilities
vim.keymap.set("n", "<leader>km", snacks.picker.keymaps, { desc = "[k]ey [m]aps" })
vim.keymap.set("n", "<leader>i", snacks.picker.icons, { desc = "[i]cons" })
vim.keymap.set("n", "<leader>rg", snacks.picker.grep, { desc = "[r]ip [g]rep" })
vim.keymap.set("n", "<leader>ql", "<cmd>copen<CR>", { desc = "[q]uickfix [l]ist" })
vim.keymap.set("n", "<leader>m", snacks.picker.marks, { desc = "[m]arks" })
vim.keymap.set("n", "<leader>uh", snacks.picker.undo, { desc = "[u]ndo [h]istory" })
vim.keymap.set(
	'n',
	'ff',
	function() require('fff').find_files() end,
	{ desc = 'FFFind files' }
)
vim.keymap.set("n", "<leader>ccm", "<cmd>CopilotChatModels<CR>", { desc = "Open Copilot Chat Models", })
---- Git
vim.keymap.set(
	"n",
	"<leader>gg",
	function() neogit.open({ kind = "tab" }) end,
	{ desc = "Open Neogit UI" }
)
vim.keymap.set("n", "<leader>bl", "<cmd>Gitsigns blame_line<CR>", { desc = "git blame line" })

---- LSP keymaps
vim.keymap.set("n", "gd", snacks.picker.lsp_definitions, { desc = "[g]oto [d]efinition" })
vim.keymap.set("n", "<leader>gr", snacks.picker.lsp_references, { desc = "[g]oto [r]eferences" })
vim.keymap.set("n", "gr", snacks.picker.lsp_references, { desc = "[g]oto [r]eferences" })
vim.keymap.set("n", "<leader>gi", snacks.picker.lsp_implementations, { desc = "[g]oto [i]mplementation" })
vim.keymap.set("n", "gi", snacks.picker.lsp_implementations, { desc = "[g]oto [i]mplementation" })
vim.keymap.set("n", "<leader>s", snacks.picker.lsp_symbols, { desc = "[g]oto [s]ymbols" })
vim.api.nvim_set_keymap("n", "D", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename under cursor" })
vim.keymap.set("n", "rn", vim.lsp.buf.rename, { desc = "Rename under cursor" })
vim.keymap.set("v", "em", "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>",
	{ desc = "[e]xtract [m]ethod jdtls" })
vim.keymap.set("n", "em", jdtls.extract_method,
	{ desc = "[e]xtract [m]ethod jdtls" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
--vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
--vim.keymap.set("v", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
vim.keymap.set({ "n", "x" }, "<leader>ca", function()
	require("tiny-code-action").code_action()
end, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>da", function()
	Snacks.picker.diagnostics()
end, { desc = "Diagnostics (Snacks)" })

---- Java keymaps
vim.keymap.set("n", "<leader>tc", jdtls.test_class, { desc = "Test class" })
vim.keymap.set("n", "<leader>tm", jdtls.test_nearest_method, { desc = "Test nearest method" })
