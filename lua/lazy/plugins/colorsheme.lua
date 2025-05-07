return {
	{
		"folke/tokyonight.nvim",
		enabled = false,
		priority = 1000,
		config = function()
			vim.cmd("colorscheme tokyonight-moon")
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		enabled = true,
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				no_italic = true,
			})
			vim.cmd("colorscheme catppuccin-mocha")
		end,
	},
	{
		"sainnhe/everforest",
		enabled = false,
		priority = 1000,
		config = function()
			vim.g.everforest_background = "hard"
			vim.cmd("colorscheme everforest")
		end,
	},
}
