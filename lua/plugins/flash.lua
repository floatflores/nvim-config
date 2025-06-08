return {
	"folke/flash.nvim",
	event = "BufReadPost",
	opts = {
		label = {
			rainbow = {
				enabled = true,
				shade = 1,
			},
		},
		modes = {
			char = {
				enabled = false,
			},
		},
	},
	keys = {
		{
			"<leader>f",
			mode = { "n", "x", "o" },
			function()
				require("flash").jump()
			end,
			desc = "[Flash] Jump",
		},
		{
			"<leader>F",
			mode = { "n", "x", "o" },
			function()
				require("flash").treesitter()
			end,
			desc = "[Flash] Treesitter",
		},
		{
			"<leader>F",
			mode = { "o", "x" },
			function()
				require("flash").treesitter_search()
			end,
			desc = "[Flash] Treesitter Search",
		},
		{
			"<leader>js",
			mode = { "c", "n" },
			function()
				require("flash").toggle()
			end,
			desc = "[Flash] Toggle Search",
		},
		{
			"<leader>jl",
			mode = { "n", "x", "o" },
			function()
				require("flash").jump({
					search = { mode = "search", max_length = 0 },
					jump = { pos = "end" },
					label = { after = { 0, 0 }, matches = false },
					pattern = "^\\s*\\S\\?", -- match non-whitespace at start plus any character (ignores empty lines)
				})
			end,
			desc = "[Flash] Line jump",
		},
	},
}
