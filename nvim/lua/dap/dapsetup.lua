local dap = require("dap")
local dapview = require("dap-view")

dapview.setup({
	winbar = {
		show = true,
		-- You can add a "console" section to merge the terminal with the other views
		sections = { "watches", "scopes", "exceptions", "breakpoints", "threads", "repl", "console" },
		-- Must be one of the sections declared above
		default_section = "watches",
		-- Configure each section individually
		base_sections = {
			breakpoints = {
				keymap = "B",
				label = "Breakpoints 🛑",
			},
			scopes = {
				keymap = "S",
				label = "Scopes 🕵️‍♂️",
			},
			exceptions = {
				keymap = "E",
				label = "Exceptions 💣",
			},
			watches = {
				keymap = "W",
				label = "Watches 👀",
			},
			threads = {
				keymap = "T",
				label = "Threads 🧵",
			},
			repl = {
				keymap = "R",
				label = "REPL ",
			},
			console = {
				keymap = "C",
				label = "Console 󰆍 ",

			},
		},

		controls = {
			enabled = true,
			buttons = { "play", "step_into", "step_over", "step_out", "term_restart", "fun" },
			custom_buttons = {
				fun = {
					render = function()
						return "🎉"
					end,
					action = function()
						vim.print("🎊")
					end,
				},
				-- Stop | Restart
				-- Double click, middle click or click with a modifier disconnect instead of stopping
				term_restart = {
					render = function(session)
						local group = session and "ControlTerminate" or "ControlRunLast"
						local icon = session and "" or ""
						return "%#NvimDapView" .. group .. "#" .. icon .. "%*"
					end,
					action = function(clicks, button, modifiers)
						local dap = require("dap")
						local alt = clicks > 1 or button ~= "l" or modifiers:gsub(" ", "") ~= ""
						if not dap.session() then
							dap.run_last()
						elseif alt then
							dap.disconnect()
						else
							dap.terminate()
						end
					end,
				},
			},
		},
	},

})
-- DAP-view
dap.listeners.before.attach.dapui_config = function()
	dapview.open()
end
dap.listeners.before.launch.dapui_config = function()
	dapview.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
	vim.cmd("DapViewClose!")
	--dapview.close()
end
dap.listeners.before.event_exited.dapui_config = function()
	vim.cmd("DapViewClose!")
	--dapview.close()
end

vim.keymap.set("n", "<leader>du", dapview.toggle, { desc = "toggle [d]ap-[u]i" })

--Dap
vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "[d]ap toggle [b]reakpoint" })
vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "[d]ap [c]ontinue" })
vim.keymap.set("n", "<leader>ds", dap.step_into, { desc = "[d]ap [s]tep into" })
vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "[d]ap step [o]ver" })

vim.fn.sign_define(
	"DapBreakpoint",
	{ text = "🤚", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
)

vim.fn.sign_define("DapBreakpointReached", {
	text = "👉",
	texthl = "DapBreakpoint",
	linehl = "DapBreakpoint",
	numhl = "DapBreakpoint",
})
vim.fn.sign_define("DapStopped", {
	text = "👉",
	texthl = "DapStopped",
	linehl = "debugPC",
	numhl = "DapStopped",
})

dap.configurations.java = {
	{
		type = 'java',
		request = 'launch',
		name = "Debug VT Controller",
		mainClass = "com.sportradar.streaming.controller.VTControllerComponent",
		args = "742",
		classPaths = {
			"conf",
			"target/vt-java-controller-app-6.12.0-SNAPSHOT.jar"
		}
	},
	{
		type = 'java',
		request = 'launch',
		name = "Debug VT VODManager",
		mainClass = "com.sportradar.streaming.vod.VODManagerComponent",
		args = "816",
		classPaths = {
			"conf",
			"vt-vod-manager-app/target/vt-vod-manager-app-2.9.0-SNAPSHOT.jar"
		}
	},
	{
		type = 'java',
		request = 'launch',
		name = 'Debug VT ClipManager',
		mainClass = 'com.sportradar.streaming.clipper.ClipManagerComponent',
		vmArgs = '-server',
		args = 'server config_clip_manager.yaml',
		classPaths = {
			'target/vt-clip-manager-0.5.0-SNAPSHOT.jar',
		},
	},
}
