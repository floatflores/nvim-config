return {
	{ "christoomey/vim-tmux-navigator", event = "VeryLazy" },
	-- pinyin input method
	{
		"h-hg/fcitx.nvim",
		event = "VeryLazy",
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
	{
		"HiPhish/rainbow-delimiters.nvim",
		event = "VeryLazy",
		main = "rainbow-delimiters.setup",
		submodules = false,
		opts = {},
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
	-- Visualize undo history
	{
		"mbbill/undotree",
		cmd = "UndotreeToggle",
		keys = {
			{ "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Undo Tree" },
		},
	},
	{ "nvim-lua/plenary.nvim" },
	{
		"windwp/nvim-ts-autotag",
		ft = {
			"html",
			"xml",
			"javascript",
			"typescript",
			"javascriptreact",
			"typescriptreact",
			"vue",
			"svelte",
			"php",
			"markdown",
		},
		opts = {},
	},

	{
		"lervag/vimtex",
		lazy = false,
		init = function()
			vim.g.vimtex_view_method = "zathura"
			vim.g.vimtex_quickfix_mode = 0
		end,
	},
}
