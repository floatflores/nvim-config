return {
	{ "christoomey/vim-tmux-navigator", event = "VeryLazy" },

	-- pinyin input method
	{
		"h-hg/fcitx.nvim",
		event = "VeryLazy",
		config = function() end,
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
		config = function()
			require("stickybuf").setup()
		end,
	},
	{
		"ethanholz/nvim-lastplace",
		lazy = false,
		config = function()
			require("nvim-lastplace").setup()
		end,
	},
}
