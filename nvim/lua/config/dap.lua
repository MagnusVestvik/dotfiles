require("dapui").setup();

local dap, dapui = require("dap"), require("dapui")
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

dap.configurations.java = {
	{
		-- You need to extend the classPath to list your dependencies.
		-- `nvim-jdtls` would automatically add the `classPaths` property if it is missing
		classPaths = {},

		-- If using multi-module projects, remove otherwise.
		projectName = "yourProjectName",

		javaExec = "/path/to/your/bin/java",
		mainClass = "your.package.name.MainClassName",

		-- If using the JDK9+ module system, this needs to be extended
		-- `nvim-jdtls` would automatically populate this property
		modulePaths = {},
		name = "Launch YourClassName",
		request = "launch",
		type = "java"
	},
}

require("dap-go").setup()
