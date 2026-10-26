return {
	"saghen/blink.cmp",
	event = "VeryLazy",
	version = "*",
	dependencies = {
		{
			"xzbdmw/colorful-menu.nvim",
			config = function()
				require("colorful-menu").setup({
					ls = {
						lua_ls = { arguments_hl = "@comment" },
						clangd = {
							extra_info_hl = "@comment",
						},
						fallback = true,
					},
					fallback_highlight = "@variable",
					max_width = 60,
				})
			end,
		},
		{ "rafamadriz/friendly-snippets" },
		{
			"danymat/neogen",
			cmd = "Neogen",
			keys = {
				{
					"<leader>cn",
					function()
						require("neogen").generate()
					end,
					desc = "Generate Annotations (Neogen)",
				},
			},
			opts = function()
				return { snippet_engine = pcall(require, "luasnip") and "luasnip" or "nvim" }
			end,
		},
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
			["<C-b>"] = { "scroll_documentation_down", "fallback" },
			["<CR>"] = { "accept", "fallback" },
			-- Signature help: toggle the window and scroll it without touching
			-- any terminal/Neovim insert-mode defaults.
			["<A-s>"] = { "show_signature", "hide_signature" },
			["<A-j>"] = { "scroll_signature_down" },
			["<A-k>"] = { "scroll_signature_up" },
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
			nerd_font_variant = "mono",
		},
		signature = {
			enabled = true,
			trigger = {
				show_on_insert = true,
				show_on_insert_on_trigger_character = true,
			},
			window = { border = "single", show_documentation = true },
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer", "dadbod", "lazydev" },
			per_filetype = { sql = { "dadbod", inherit_defaults = true } },
			providers = {
				buffer = { score_offset = 40 },
				lsp = { score_offset = 90 },
				path = { score_offset = 70 },
				snippets = { score_offset = 75 },
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
		cmdline = {
			sources = function()
				local cmd_type = vim.fn.getcmdtype()
				if cmd_type == "/" then
					return { "buffer" }
				end
				if cmd_type == ":" then
					return { "cmdline" }
				end
				return {}
			end,
		},

		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
	opts_extend = { "sources.default" },
	config = function(_, opts)
		-- Prefer LuaSnip when it is available, otherwise fall back to blink's
		-- built-in vim.snippet support (which also reads friendly-snippets).
		if pcall(require, "luasnip") then
			opts.snippets = vim.tbl_deep_extend("force", opts.snippets or {}, { preset = "luasnip" })
		end
		require("blink.cmp").setup(opts)
	end,
}
