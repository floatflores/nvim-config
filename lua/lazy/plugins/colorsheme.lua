return {
	{
		"folke/tokyonight.nvim",
		enabled = false,
		priority = 1000,
		config = function()
			vim.cmd("colorsheme tokyonight-moon")
		end,
	},
	{
    "catppuccin/nvim",
    name = "catppuccin",
    enabled = false,
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
		enabled = true,
		priority = 1000,
		config = function()
			vim.g.everforest_background = "hard"
			vim.cmd("colorscheme everforest")
		end,
	},
}
