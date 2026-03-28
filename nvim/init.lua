require("plugins")
require("settings.gitsigns")
require("settings.glimmer")
require("settings.mason")
require("settings.yazi")
require("settings.mini_surround")

require("options")

require("lsp.lspsetup")
require("lsp.completion")
require("lsp.inline-diagnostics")
require("lsp.conform_formatting")
require("dap.dapsetup")

require("ui.colorschemes")

-- keymaps should be loaded last
require("keymaps")
