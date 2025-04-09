return {
	"lewis6991/gitsigns.nvim",
	lazy = true,
	keys = {
		{
			"<leader>gd",
			function()
				require("gitsigns").diffthis()
			end,
			mode = { "n" },
			desc = "Show [G]it [D]iffs",
		},
		{
			"<leader>gb",
			function()
				require("gitsigns").blame()
			end,
			mode = { "n" },
			desc = "Show [G]it [B]lame",
		},
		{
			"<leader>gts",
			function()
				require("gitsigns").toggle_signs()
			end,
			mode = { "n" },
			desc = "[G]it [T]oggle [S]ign",
		},
	},
	opts = {},
}
