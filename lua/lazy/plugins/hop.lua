return {
	"hadronized/hop.nvim",
	lazy = true,
	opts = {},
	keys = {
		{
			"ss",
			function()
				require("hop").hint_words()
			end,
			mode = { "n", "v" },
			desc = "Hop Hint Words",
		},
		{
			"<S-s>",
			function()
				require("hop").hint_lines()
			end,
			mode = { "n", "v" },
			desc = "Hop Hint Lines",
		},
		{
			"sp",
			function()
				require("hop").hint_patterns()
			end,
			mode = { "n", "v" },
			desc = "Hop Hint Pattern",
		},
		{
			"sc",
			function()
				require("hop").hint_char1()
			end,
			mode = { "n", "v" },
			desc = "Hop Hint Char",
		},
	},
}
