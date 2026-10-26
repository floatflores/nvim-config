return {
	{
		"mfussenegger/nvim-dap",
		lazy = true,
		config = function()
			require("config.debugger")
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "theHamsta/nvim-dap-virtual-text", "nvim-neotest/nvim-nio" },
		keys = {
			{
				"<leader>db",
				function()
					require("dap").toggle_breakpoint()
				end,
				desc = "DAP: Breakpoint",
			},
			{
				"<leader>dB",
				function()
					local input = vim.fn.input("Condition for breakpoint:")
					require("dap").set_breakpoint(input)
				end,
				desc = "DAP: Conditional Breakpoint",
			},
			{
				"<leader>dD",
				function()
					require("dap").clear_breakpoints()
				end,
				desc = "DAP: Clear Breakpoints",
			},
			{
				"<leader>ds",
				function()
					require("dap").continue()
				end,
				desc = "DAP: Start/Continue",
			},
			{
				"<leader>di",
				function()
					require("dap").step_into()
				end,
				desc = "DAP: Step into",
			},
			{
				"<leader>do",
				function()
					require("dap").step_over()
				end,
				desc = "DAP: Step over",
			},
			{
				"<leader>dO",
				function()
					require("dap").step_out()
				end,
				desc = "DAP: Step out",
			},
			{
				"<leader>dq",
				function()
					require("dap").close()
				end,
				desc = "DAP: Close session",
			},
			{
				"<leader>dQ",
				function()
					require("dap").terminate()
				end,
				desc = "DAP: Terminate session",
			},
			{
				"<leader>dr",
				function()
					require("dap").restart_frame()
				end,
				desc = "DAP: Restart Frame",
			},
			{
				"<leader>dc",
				function()
					require("dap").run_to_cursor()
				end,
				desc = "DAP: Run to Cursor",
			},
			{
				"<leader>dh",
				function()
					require("dap.ui.widgets").hover()
				end,
				desc = "DAP: Hover",
			},
			{
				"<leader>du",
				function()
					require("dapui").toggle()
				end,
				desc = "DAP: Toggle UI",
			},
		},
		config = function()
			require("nvim-dap-virtual-text").setup()
			require("config.dapui")
		end,
	},
}
