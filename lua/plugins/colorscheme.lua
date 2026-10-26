return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			-- transparent_background = true,
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
				alpha = true,
				blink_cmp = true,
				colorful_winsep = true,
				dadbod_ui = true,
				dap = true,
				dap_ui = true,
				dropbar = true,
				flash = true,
				lsp_trouble = true,
				mason = true,
				mini = true,
				notifier = true,
				rainbow_delimiters = true,
				render_markdown = true,
				snacks = true,
				which_key = true,
			},
		},
		config = function(_, opts)
			require("catppuccin").setup(opts)
			vim.cmd.colorscheme("catppuccin-mocha")
		end,
	},
}
