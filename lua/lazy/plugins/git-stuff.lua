return {
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		keys = {
			{
				"<leader>gp",
				"<cmd>Gitsigns preview_hunk_inline<CR>",
				mode = { "n" },
				desc = "[G]itsign [P]review Inline",
			},
		},
		opts = {},
	},
}
