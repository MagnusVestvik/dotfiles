local vim = vim

require("config.lazy")

require("mason").setup()
require("mini.ai").setup()
require("mini.operators").setup()
require("mini.pairs").setup()
require("mini.surround").setup()
require("mini.indentscope").setup()

require("general")
require("keybind")
require("dapconfig")
require("lsp")
require("treesitter")
require("format")
require("git")
require("navigation")
require("glimmer")
require("diagnostics")

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
