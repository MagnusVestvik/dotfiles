local vim = vim
local dap, dapui = require("dap"), require("dapui")
local dapview = require("dap-view")
require("dapui").setup()

dap.listeners.before.attach.dapui_config = function()
    dapview.open()
end
dap.listeners.before.launch.dapui_config = function()
    dapview.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
    dapview.close()
end
dap.listeners.before.event_exited.dapui_config = function()
    dapview.close()
end

vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, {})
vim.keymap.set("n", "<Leader>dc", dap.continue, {})
--vim.keymap.set("n", "<Leader>du", ":lua require('dapui').toggle()<CR>", {})
vim.keymap.set("n", "<leader>du", dapview.toggle, { desc = "toggle [d]ap-[u]i" })

vim.fn.sign_define(
    "DapBreakpoint",
    { text = "⏺", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
)


dap.configurations.java = {
    {
        type = 'java',
        request = 'launch',
        name = "Debug VT Controller",
        mainClass = "com.sportradar.streaming.controller.VTControllerComponent",
        args = "742",
        classPaths = {
            "conf",
            "target/vt-java-controller-app-6.8.0-SNAPSHOT.jar"
        }
    }
}
