return {
	"saghen/blink.cmp",
	event = "VeryLazy",
	version = "1.*",
	dependencies = {
		"xzbdmw/colorful-menu.nvim",
		config = function()
			require("colorful-menu").setup({
				ls = {
					lua_ls = { arguments_hl = "@comment" },
					clangd = {
						extra_info_hl = "@comment",
					},
					basedpyright = {
						extra_info_hl = "@comment",
					},
					fallback = true,
				},
				fallback_highlight = "@variable",
				max_width = 60,
			})
		end,
		{ "rafamadriz/friendly-snippets" },
	},
	opts = {
		keymap = {
			preset = "none",
			["<ESC>"] = { "cancel", "fallback" },
			["<Up>"] = { "select_prev", "snippet_forward", "fallback" },
			["<Down>"] = { "select_next", "snippet_backward", "fallback" },
			["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
			["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
			["<C-f>"] = { "scroll_documentation_up", "fallback" },
			["<C-b>"] = { "scroll_documentation_up", "fallback" },
			["<CR>"] = { "accept", "fallback" },
		},
		completion = {
			keyword = { range = "full" },
			list = { selection = { preselect = false, auto_insert = true } },
			menu = {
				border = "single",
				draw = {
					columns = { { "kind_icon" }, { "label", gap = 1 } },
					components = {
						label = {
							text = function(ctx)
								return require("colorful-menu").blink_components_text(ctx)
							end,
							highlight = function(ctx)
								return require("colorful-menu").blink_components_highlight(ctx)
							end,
						},
					},
				},
			},

			documentation = {
				window = { border = "single" },
				auto_show = true,
				auto_show_delay_ms = 500,
			},
		},

		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},
		signature = {
			window = { border = "single" },
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer", "dadbod", "lazydev" },
			per_filetype = { sql = { "dadbod" } },
			providers = {
				buffer = { score_offset = 4 },
				lsp = { score_offset = 3 },
				path = { score_offset = 2 },
				snippets = { score_offset = 1 },
				dadbod = {
					name = "Dadbod",
					module = "vim_dadbod_completion.blink",
					score_offset = 100,
				},
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					score_offset = 100,
				},
			},
		},

		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
	opts_extend = { "sources.default" },
}
