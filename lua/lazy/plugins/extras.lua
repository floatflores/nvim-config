return {

	{ "christoomey/vim-tmux-navigator", event = "VeryLazy" },
	-- pinyin input method
	{
		"h-hg/fcitx.nvim",
		event = "VeryLazy",
	},
	{
		"j-hui/fidget.nvim",
		enabled = false,
		opts = {},
	},
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	-- manual saved session
	{
		"olimorris/persisted.nvim",
		lazy = false, -- make sure the plugin is always loaded at startup
		config = true,
	},
	-- session and projects
	{
		"stevearc/stickybuf.nvim",
		event = "VeryLazy",
		config = true,
	},
	{
		"ethanholz/nvim-lastplace",
		lazy = false,
		config = true,
	},
	{
		"tribela/transparent.nvim",
		config = true,
		enabled = false,
	},
}
