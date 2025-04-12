return {
	"saghen/blink.cmp",
	event = "VeryLazy",
	dependencies = "rafamadriz/friendly-snippets",
	version = "*",
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
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 500,
			},
		},

		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
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
					-- make lazydev completions top priority (see `:h blink.cmp`)
					score_offset = 100,
				},
			},
		},

		-- Blink.cmp uses a Rust fuzzy matcher by default for typo resistance and significantly better performance
		-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
		-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
		--
		-- See the fuzzy documentation for more information
		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
	opts_extend = { "sources.default" },
}
