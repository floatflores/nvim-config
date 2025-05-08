return {
	"folke/trouble.nvim",
	opts = {}, -- for default options, refer to the configuration section for custom setup.
	event = "LspAttach",
	cmd = "Trouble",
	keys = {
		{
			"<leader>tD",
			"<cmd>Trouble diagnostics toggle<cr>",
			desc = "[T]rouble [D]iagnostics all buffers",
		},
		{
			"<leader>td",
			"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
			desc = "[T]rouble [D]iagnostics",
		},
		{
			"<leader>ts",
			"<cmd>Trouble symbols toggle focus=false<cr>",
			desc = "[T]rouble [S]ymbols",
		},
		{
			"<leader>tf",
			"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
			desc = "[T]rouble [F]ocus Definition/Reference... under cursor",
		},
		{
			"<leader>tl",
			"<cmd>Trouble loclist toggle<cr>",
			desc = "[T]rouble [L]ocklist",
		},
		{
			"<leader>tqf",
			"<cmd>Trouble qflist toggle<cr>",
			desc = "[T]rouble [Q]uick[F]ix list",
		},
	},
}
