return {
	"nvim-telescope/telescope.nvim",
	lazy = true,
	cmd = "Telescope",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"BurntSushi/ripgrep",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
		},
	},
	keys = {
		{
			"<leader>ff",
			function()
				require("telescope.builtin").find_files({ hidden = true, initial_mode = "insert" })
			end,
			desc = "Telescope find file (cwd)",
		},
		{
			"<leader>FF",
			function()
				require("telescope.builtin").find_files({ hidden = true, cwd = "/", initial_mode = "insert" })
			end,
			desc = "Telescope find file (Root)",
		},
		{
			"<leader>fg",
			function()
				require("telescope.builtin").live_grep({ initial_mode = "insert" })
			end,
			desc = "Telescope live grep (cwd)",
		},
		{
			"<leader>FG",
			function()
				require("telescope.builtin").live_grep({ cwd = "/", initial_mode = "insert" })
			end,
			desc = "Telescope live grep (Root)",
		},
		{
			"<leader>fsg",
			function()
				require("telescope.builtin").grep_string({ initial_mode = "insert" })
			end,
			desc = "Telescope grep string (under cursor from cwd)",
		},
		{
			"<leader>FSG",
			function()
				require("telescope.builtin").grep_string({ cwd = "/", initial_mode = "insert" })
			end,
			desc = "Telescope grep string (under cursor from Root)",
		},
		{
			"<leader>f.",
			function()
				require("telescope.builtin").current_buffer_fuzzy_find({ initial_mode = "insert" })
			end,
			desc = "Telescope grep current file",
		},
		{
			"<leader>h",
			function()
				require("telescope.builtin").oldfiles({ initial_mode = "insert" })
			end,
			desc = "Telescope History Files",
		},
		{
			"<leader>/",
			function()
				require("telescope.builtin").search_history({ initial_mode = "insert" })
			end,
			desc = "Telescope Search History",
		},
		{
			"<leader>fb",
			function()
				require("telescope.builtin").buffers({ initial_mode = "insert" })
			end,
			desc = "Telescope Show Buffers",
		},
		{
			"<leader>mm",
			function()
				require("telescope.builtin").marks({ initial_mode = "insert" })
			end,
			desc = "Telescope Show All Marks",
		},
		-- lsp configuration,
		{
			"gd",
			function()
				require("telescope.builtin").lsp_definitions()
			end,
			desc = "Telescope Goto Definition",
		},
		{
			"gr",
			function()
				require("telescope.builtin").lsp_references()
			end,
			desc = "Telescope Goto References",
		},
		{
			"gi",
			function()
				require("telescope.builtin").lsp_implementations()
			end,
			desc = "Telescope Goto Implementations",
		},
		{
			"gt",
			function()
				require("telescope.builtin").lsp_type_definitions({ initial_mode = "insert" })
			end,
			desc = "Telescope Goto Type Defnitions",
		},
		{
			"<leader>ks",
			function()
				require("telescope.builtin").keymaps()
			end,
			desc = "Telescope List All Keymaps",
		},
	},
	config = function()
		require("telescope").setup({
			defaults = {
				initial_mode = "normal",
			},
			mappings = {
				n = {
					["<esc>"] = require("telescope.actions").close,
				},
			},
			extensions = {
				fzf = {
					fuzzy = true, -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case", -- or "ignore_case" or "respect_case"
					-- the default case_mode is "smart_case"
				},
			},
		})
		require("telescope").load_extension("fzf")
	end,
}
