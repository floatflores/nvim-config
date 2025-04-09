return {
	{
		"lewis6991/gitsigns.nvim",
		lazy = true,
		keys = {
			{ "<leader>gp", "<cmd>Gitsigns preview_hunk<CR>", mode = { "n" }, desc = "[G]itsign [P]review" },
		},
		opts = {},
	},
	{ "tpope/vim-fugitive" },
}
