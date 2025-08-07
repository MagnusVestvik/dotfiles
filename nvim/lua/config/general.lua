local vim = vim
vim.opt.clipboard:append("unnamedplus")
vim.wo.number = true
vim.wo.relativenumber = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.autoindent = false
vim.opt.scrolloff = 10
vim.opt.smartindent = false
vim.opt.cindent = false
vim.opt.timeoutlen = 0
vim.opt.updatetime = 0
vim.wo.wrap = false
vim.opt.swapfile = false
vim.bo.swapfile = false
vim.o.wrap = false
-- menuone - show popup menu also when there is only one match available
-- preview - show extra information about currently selected completion
-- noinsert - do not insert any text for match until the user selects it from the menu
vim.opt.completeopt = "menuone,preview,noselect"

vim.o.winborder = "rounded"

vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
vim.api.nvim_set_hl(0, "FloatBorder", { link = "Normal" })



vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1e1e2e" }) -- no transparency or weird padding
