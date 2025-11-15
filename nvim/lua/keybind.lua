local vim = vim
local jdtls = require('jdtls')
local fzflua = require('fzf-lua')
local Terminal  = require('toggleterm.terminal').Terminal

vim.keymap.set("n", "<leader>rg", function()
    fzflua.live_grep()
end, { desc = "Find buffers" })

vim.keymap.set("n", "<leader>ss", function()
    fzflua.lsp_document_symbols()
end, { desc = "Find buffers" })

vim.keymap.set("n", "<A-l>", ":bnext<CR>", { silent = true })
vim.keymap.set("n", "<A-h>", ":bprevious<CR>", { silent = true })

vim.api.nvim_set_keymap("n", "gh", "^", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "gl", "$", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "gh", "^", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "gl", "$", { noremap = true, silent = true })

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

vim.keymap.set("n", "<leader>z", fzflua.zoxide, { desc = "fzf-lua: zoxide" })
vim.keymap.set("n", "<leader>gb", fzflua.git_branches, { desc = "List git branches" })
vim.keymap.set("n", "<leader>ldc", fzflua.dap_commands, { desc = "List dap commands" })
vim.keymap.set("n", "<leader>bl", fzflua.git_blame, { desc = "Blame line" })
vim.keymap.set("n", "<C-e>", fzflua.marks, { desc = "List marks" })
vim.keymap.set("n", "<leader>gs", fzflua.grep_cword, { desc = "Grep for word under cursor" })
vim.keymap.set("v", "<leader>gs", fzflua.grep_visual, { desc = "Grep for word under cursor" })

-- LSP keymaps
vim.keymap.set("n", "gd", fzflua.lsp_definitions, { desc = "[G]oto [D]efinition" })
vim.keymap.set("n", "gr", fzflua.lsp_references, { desc = "[G]oto [R]eferences" })
vim.keymap.set("n", "gI", fzflua.lsp_implementations, { desc = "[G]oto [I]mplementation" })
vim.keymap.set("n", "gi", fzflua.lsp_implementations, { desc = "[G]oto [I]mplementation" })
vim.keymap.set("n", "<leader>D", fzflua.lsp_typedefs, { desc = "Type [D]efinition" })
vim.keymap.set("n", "<leader>ca", fzflua.lsp_code_actions, { desc = "[C]ode Actions" })
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>")
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>")
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>")
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>")

vim.api.nvim_set_keymap("n", "D", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>tc", function()
    if vim.bo.filetype == "java" then
        require("java").test.debug_current_class()
    end
end, { desc = "Run test class" })

vim.keymap.set("n", "<leader>tm", function()
    if vim.bo.filetype == "java" then
        require("java").test.debug_current_method()
    end
end, { desc = "Run nearest test method" })

vim.keymap.set("n", "<leader>jt", function()
    if vim.bo.filetype == "java" then
        require("java").profile.ui()
    end
end, { desc = "Run test class" })

-- Select previously pasted text
vim.keymap.set("n", "gp", "`[v`]", { desc = "Select previously pasted text" })


--Lsp keymaps
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename under cursor" })

vim.keymap.set("n", "<leader>rn", vim.lsp.buf.code_action, { desc = "Code action" })
-- Java keymaps
vim.keymap.set("n", "<leader>tc", jdtls.test_class, { desc = "Test class" })
vim.keymap.set("n", "<leader>tm", jdtls.test_nearest_method, { desc = "Test nearest method" })

local terminal = Terminal:new({
    direction = "float",
    -- function to run on opening the terminal
    on_open = function(term)
    end,
    -- function to run on closing the terminal
    on_close = function(term)
    end,
})

function terminal_toggle()
    terminal:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>tt", "<cmd>lua terminal_toggle()<CR>", { noremap = true, silent = true })
