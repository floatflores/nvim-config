return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		bigfile = { enabled = true },
		dashboard = { enabled = false },
		explorer = { enabled = false },
		indent = {
			enabled = true,
			animate = {
				enabled = false,
			},
			scope = {
				enabled = true,
				underline = true,
			},
			chunk = {
				enabled = true,
			},
		},
		input = { enabled = true },
		terminal = {
			enabled = true,
		},
		styles = {
			terminal = {
				relative = "editor",
				border = "rounded",
				position = "float",
				backdrop = 60,
				height = 0.9,
				width = 0.9,
				zindex = 50,
			},
		},
		picker = {
			enabled = true,
			previewers = {
				diff = {
					builtin = false,
					cmd = { "delta" },
				},
				git = {
					builtin = false,
					args = {},
				},
			},
			sources = {
				spelling = {
					layout = { preset = "select" },
				},
			},
			win = {
				input = {
					keys = {
						["<S-Tab>"] = { "select_and_prev", mode = { "i", "n" } },
						["<Tab>"] = { "select_and_next", mode = { "i", "n" } },
						["<A-Up>"] = { "history_back", mode = { "n", "i" } },
						["<A-Down>"] = { "history_forward", mode = { "n", "i" } },
						["<A-j>"] = { "list_down", mode = { "n", "i" } },
						["<A-k>"] = { "list_up", mode = { "n", "i" } },
						["<C-u>"] = { "preview_scroll_up", mode = { "n", "i" } },
						["<C-d>"] = { "preview_scroll_down", mode = { "n", "i" } },
						["<A-u>"] = { "list_scroll_up", mode = { "n", "i" } },
						["<A-d>"] = { "list_scroll_down", mode = { "n", "i" } },
						["<c-j>"] = {},
						["<c-k>"] = {},
					},
				},
			},
			layout = {
				preset = "telescope",
			},
		},
		notifier = { enabled = true, style = "notification" },
		quickfile = { enabled = true },
		scope = { enabled = true },
		image = {},
		scroll = { enabled = true },
		statuscolumn = { enabled = true },
		words = { enabled = true },
		lazygit = {
			enabled = true,
			configure = false,
		},
	},
	keys = {
		{
			"<C-t>",
			function()
				require("snacks").terminal()
			end,
			desc = "[Snacks] Toggle terminal",
			mode = { "n", "t" },
		},
		{
			"<C-e>",
			function()
				require("snacks").lazygit()
			end,
			desc = "[Snacks] Lazygit",
			mode = { "n" },
		},
		{
			"<leader><space>",
			function()
				require("snacks").picker.smart()
			end,
			desc = "[Snacks] Smart File Finder",
		},
		{
			"<leader>rf",
			function()
				require("snacks").picker.recent()
			end,
			desc = "[Snacks] Recent File",
		},
		{
			"<leader>gs",
			function()
				require("snacks").picker.grep()
			end,
			desc = "[Snacks] Find String From Dir",
		},
		{
			"<leader>g.",
			function()
				Snacks.picker.grep_buffers()
			end,
			desc = "[Snacks] Grep Open Buffers",
		},
		{
			"<leader>sw",
			function()
				Snacks.picker.grep_word()
			end,
			desc = "[Snacks] Visual selection or word",
			mode = { "n", "x" },
		},
		{
			"<leader>sk",
			function()
				require("snacks").picker.keymaps()
			end,
			desc = "[Snacks] Keymaps",
		},
		{
			"<leader>sl",
			function()
				require("snacks").picker.loclist()
			end,
			desc = "[Snacks] Location list",
		},
		{
			"<leader>sq",
			function()
				require("snacks").picker.qflist()
			end,
			desc = "[Snacks] Quickfix list",
		},
		{
			"<leader>,",
			function()
				require("snacks").picker.buffers()
			end,
			desc = "[Snacks] Buffers Picker",
		},
		{
			"<leader>un",
			function()
				require("snacks").notifier.hide()
			end,
			desc = "[Snack] Hide Notification",
		},
		{
			"<leader>sp",
			function()
				require("snacks").picker.projects()
			end,
			desc = "[Snacks] Projects",
		},
		{
			"<leader>e",
			function()
				require("snacks").explorer()
			end,
			desc = "[Snacks] Explorer",
		},
		{
			"<leader>sn",
			function()
				require("snacks").picker.notifications()
			end,
			desc = "[Snacks] Show Notifications History",
		},
		{
			"<leader>cb",
			function()
				require("snacks").bufdelete()
			end,
			desc = "[Snacks] Close Buffer",
		},
		-- LSP
		{
			"gd",
			function()
				require("snacks").picker.lsp_definitions()
			end,
			desc = "Goto Definition",
		},
		{
			"gD",
			function()
				require("snacks").picker.lsp_declarations()
			end,
			desc = "Goto Declaration",
		},
		{
			"gr",
			function()
				require("snacks").picker.lsp_references()
			end,
			nowait = true,
			desc = "References",
		},
		{
			"gI",
			function()
				require("snacks").picker.lsp_implementations()
			end,
			desc = "Goto Implementation",
		},
		{
			"gy",
			function()
				require("snacks").picker.lsp_type_definitions()
			end,
			desc = "Goto T[y]pe Definition",
		},
		{
			"<leader>ss",
			function()
				require("snacks").picker.lsp_symbols()
			end,
			desc = "LSP Symbols",
		},
		{
			"<leader>sS",
			function()
				require("snacks").picker.lsp_workspace_symbols()
			end,
			desc = "LSP Workspace Symbols",
		},
	},
}
