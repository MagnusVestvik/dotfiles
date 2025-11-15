local dap, dapui = require("dap"), require("dapui")
local vim = vim
require("dapui").setup()

dap.listeners.before.attach.dapui_config = function()
    dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
    dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
    dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
    dapui.close()
end

vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, {})
vim.keymap.set("n", "<Leader>dc", dap.continue, {})
vim.keymap.set("n", "<Leader>du", ":lua require('dapui').toggle()<CR>", {})

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
