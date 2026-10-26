-- UI responsiveness
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

-- customize UI layout
dapui.setup({
	layouts = {
		{
			position = "left",
			size = 0.3,
			elements = {
				{ id = "stacks", size = 0.2 },
				{ id = "scopes", size = 0.5 },
				{ id = "breakpoints", size = 0.15 },
				{ id = "watches", size = 0.15 },
			},
		},
		{
			position = "bottom",
			size = 0.2,
			elements = {
				{ id = "repl", size = 0.3 },
				{ id = "console", size = 0.7 },
			},
		},
	},
})

-- Custom breakpoint icons
vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DapBreakpoint", linehl = "", numhl = "DapBreakpoint" })
vim.fn.sign_define("DapBreakpointCondition", {
	text = "",
	texthl = "DapBreakpointCondition",
	linehl = "DapBreakpointCondition",
	numhl = "DapBreakpointCondition",
})
vim.fn.sign_define("DapStopped", { text = "", texthl = "DapStopped", linehl = "DapStopped", numhl = "DapStopped" })

-- Keymaps live in lua/plugins/nvim-dap.lua so the first keypress works
-- before the plugin is lazily loaded.
