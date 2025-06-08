return {
	"hadronized/hop.nvim",
	lazy = true,
	opts = {},
	keys = {
		{
			"<leader>jw",
			function()
				require("hop").hint_words()
			end,
			mode = { "n", "v" },
			desc = "Hop Hint Words",
		},
	},
}
