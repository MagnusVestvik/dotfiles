vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.clipboard:append("unnamedplus")
vim.wo.number = true
vim.wo.relativenumber = true
vim.opt.scrolloff = 15
vim.opt.spell = true
vim.opt.spelllang = "en_us"
vim.opt.autoindent = false
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.termguicolors = true


vim.env.PATH = vim.env.PATH .. ":/snap/bin"
