--vim.cmd("colorscheme gruvbox-material")
local vim = vim
vim.o.termguicolors = true
--vim.cmd("colorscheme kanagawa-paper-ink")

require("kanagawa-paper").setup({
    transparent = false,
    overrides = function(colors)
        return {
            NormalFloat = { bg = "NONE" },
            FloatBorder = { bg = "NONE" },
            FloatTitle = { bg = "none" },
        }
    end,
})


vim.cmd("colorscheme kanagawa-paper-ink")





vim.api.nvim_create_augroup("BorderFix", { clear = true })
vim.api.nvim_create_autocmd("ColorScheme", {
    group = "BorderFix",
    pattern = "*",
    callback = function()
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "FzfLuaBorder", { link = "FloatBorder" })
        vim.api.nvim_set_hl(0, "FzfLuaNormal", { link = "NormalFloat" })
    end,
})



vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { link = "FloatBorder" })
