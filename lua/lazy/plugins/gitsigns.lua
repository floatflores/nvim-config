return {
	"lewis6991/gitsigns.nvim",
	event = "VeryLazy",
	keys = {
		{
			"<leader>gph",
			"<cmd>Gitsigns prev_hunk<CR>",
			mode = { "n" },
			desc = "[G]itsign [P]reviou [H]unk",
		},
		{
			"<leader>gnh",
			"<cmd>Gitsigns next_hunk<CR>",
			mode = { "n" },
			desc = "[G]itsign [N]ext [H]unk",
		},
		{
			"<leader>gpi",
			"<cmd>Gitsigns preview_hunk_inline<CR>",
			mode = { "n" },
			desc = "[G]itsigns [P]review Hunk [I]nline",
		},
		{
			"<leader>gb",
			"<cmd>Gitsigns blame<CR>",
			mode = { "n" },
			desc = "[G]itsign [B]lame",
		},
	},
	opts = {},
}
