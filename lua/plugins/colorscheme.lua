return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			transparent_background = true,
			custom_highlights = function(colors)
				return {
					LineNr = { fg = colors.surface2 },
					Visual = { bg = colors.overlay0 },
					Search = { bg = colors.surface2 },
					IncSearch = { bg = colors.lavender },
					CurSearch = { bg = colors.lavender },
					MatchParen = { bg = colors.lavender, fg = colors.base, bold = true },
				}
			end,
			integrations = {
				barbar = true,
				blink_cmp = true,
				gitsigns = true,
				mason = true,
				noice = true,
				notify = true,
				nvimtree = true,
				rainbow_delimiters = true,
			},
		},
		config = function(_, opts)
			require("catppuccin").setup(opts)
			vim.cmd.colorscheme("catppuccin-mocha")
		end,
	},
	{
		"folke/tokyonight.nvim",
		event = "VeryLazy",
		-- enabled = false,
		-- priority = 1000,
		-- config = function()
		-- 	vim.cmd("colorscheme tokyonight-moon")
		-- end,
	},
	{
		"sainnhe/everforest",
		event = "VeryLazy",
		-- enabled = false,
		-- priority = 1000,
		-- config = function()
		-- 	vim.g.everforest_background = "hard"
		-- 	vim.cmd("colorscheme everforest")
		-- end,
	},
	{ "ellisonleao/gruvbox.nvim", event = "VeryLazy" },
}
