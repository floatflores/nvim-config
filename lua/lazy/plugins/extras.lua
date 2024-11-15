return {
	{ "christoomey/vim-tmux-navigator" },

	-- pinyin input method
	{
		"h-hg/fcitx.nvim",
		event = "BufReadPost",
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
		config = function()
			require("stickybuf").setup()
		end,
	},
	{
		"ethanholz/nvim-lastplace",
		config = function()
			require("nvim-lastplace").setup()
		end,
	},
}
