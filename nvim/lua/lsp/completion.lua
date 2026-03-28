local blink = require("blink.cmp")

blink.setup({
    keymap = {
        preset = "default", -- or "super-tab", "none"
    },
    sources = {
        default = { "lsp", "path", "snippets", "buffer" },
    },
    completion = {
        documentation = { auto_show = true },
    },
})
