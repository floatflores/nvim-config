return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		bigfile = { enabled = true },
		dashboard = { enabled = false },
		explorer = { enabled = false },
		indent = {
			enabled = true,
			animate = {
				enabled = false,
			},
		},
		input = { enabled = true },
		terminal = {
			enabled = true,
		},
		styles = {
			terminal = {
				relative = "editor",
				border = "rounded",
				position = "float",
				backdrop = 60,
				height = 0.9,
				width = 0.9,
				zindex = 50,
			},
		},
		picker = { enabled = false },
		notifier = { enabled = true },
		quickfile = { enabled = true },
		scope = { enabled = true },
		scroll = { enabled = true },
		statuscolumn = { enabled = true },
		words = { enabled = true },
		lazygit = {
			enabled = true,
			configure = false,
		},
	},
	keys = {
		{
			"<C-t>",
			function()
				require("snacks").terminal()
			end,
			desc = "[Snacks] Toggle terminal",
			mode = { "n", "t" },
		},
		{
			"<C-e>",
			function()
				require("snacks").lazygit()
			end,
			desc = "[Snacks] Lazygit",
			mode = { "n" },
		},
	},
}
