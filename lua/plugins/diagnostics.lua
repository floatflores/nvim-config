-- Inline diagnostics that wrap long LSP messages instead of truncating them
-- at the window edge (Neovim's built-in virtual_text cannot wrap).
return {
	"rachartier/tiny-inline-diagnostic.nvim",
	event = "VeryLazy",
	priority = 1000,
	opts = {
		preset = "modern",
		options = {
			show_source = { enabled = true, if_many = true },
			multilines = { enabled = true },
			overflow = { mode = "wrap" },
			enable_on_insert = false,
			enable_on_select = false,
		},
	},
}
