return {
	"saghen/blink.cmp",
	-- optional: provides snippets for the snippet source
	event = "VeryLazy",
	dependencies = "rafamadriz/friendly-snippets",

	-- use a release tag to download pre-built binaries
	version = "*",
	-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
	-- build = 'cargo build --release',
	-- If you use nix, you can build from source using latest nightly rust with:
	-- build = 'nix run .#build-plugin',

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept, C-n/C-p for up/down)
		-- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys for up/down)
		-- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
		--
		-- All presets have the following mappings:
		-- C-space: Open menu or open docs if already open
		-- C-e: Hide menu
		-- C-k: Toggle signature help
		--
		-- See the full "keymap" documentation for information on defining your own keymap.
		keymap = {
			preset = "none",
			["<ESC>"] = { "cancel", "fallback" },
			["<Up>"] = { "select_prev", "snippet_forward", "fallback" },
			["<Down>"] = { "select_next", "snippet_backward", "fallback" },
			["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
			["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
			["<C-f>"] = { "scroll_documentation_up", "fallback" },
			["<C-b>"] = { "scroll_documentation_up", "fallback" },
			["<CR>"] = { "select_and_accept", "fallback" },
		},
		completion = {
			keyword = { range = "full" },
			list = { selection = { preselect = false, auto_insert = true } },
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 500,
			},
		},
		signature = { enabled = true },

		appearance = {
			-- Sets the fallback highlight groups to nvim-cmp's highlight groups
			-- Useful for when your theme doesn't support blink.cmp
			-- Will be removed in a future release
			use_nvim_cmp_as_default = true,
			-- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
			-- Adjusts spacing to ensure icons are aligned
			nerd_font_variant = "mono",
		},

		-- Default list of enabled providers defined so that you can extend it
		-- elsewhere in your config, without redefining it, due to `opts_extend`
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
