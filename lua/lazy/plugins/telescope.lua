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
			desc = "Telescope [F]ind [F]ile (cwd)",
		},
		{
			"<leader>fF",
			function()
				require("telescope.builtin").find_files({ hidden = true, cwd = "/", initial_mode = "insert" })
			end,
			desc = "Telescope [F]ind [F]ile (Root)",
		},
		{
			"<leader>fs",
			function()
				require("telescope.builtin").live_grep({ initial_mode = "insert" })
			end,
			desc = "Telescope [F]ind [S]tring (cwd)",
		},
		{
			"<leader>fS",
			function()
				require("telescope.builtin").live_grep({ cwd = "/", initial_mode = "insert" })
			end,
			desc = "Telescope [F]ind [S]tring (Root)",
		},
		{
			"<leader>gs",
			function()
				require("telescope.builtin").grep_string({ initial_mode = "insert" })
			end,
			desc = "Telescope [G]rep [S]tring (under cursor from cwd)",
		},
		{
			"<leader>gS",
			function()
				require("telescope.builtin").grep_string({ cwd = "/", initial_mode = "insert" })
			end,
			desc = "Telescope [G]rep [S]tring (under cursor from Root)",
		},
		{
			"<leader>f.",
			function()
				require("telescope.builtin").current_buffer_fuzzy_find({ initial_mode = "insert" })
			end,
			desc = "Telescope grep [F]rom [.]current file",
		},
		{
			"<leader>hf",
			function()
				require("telescope.builtin").oldfiles({ initial_mode = "insert" })
			end,
			desc = "Telescope [H]istory [F]iles",
		},
		{
			"<leader>h/",
			function()
				require("telescope.builtin").search_history({ initial_mode = "insert" })
			end,
			desc = "Telescope [H]istory [/]Search",
		},
		{
			"<leader>sb",
			function()
				require("telescope.builtin").buffers({ initial_mode = "insert" })
			end,
			desc = "Telescope [S]how [B]uffers",
		},
		{
			"<leader>sm",
			function()
				require("telescope.builtin").marks({ initial_mode = "insert" })
			end,
			desc = "Telescope [S]how All [M]arks",
		},
		-- lsp configuration,
		-- {
		-- 	"gd",
		-- 	function()
		-- 		require("telescope.builtin").lsp_definitions()
		-- 	end,
		-- 	desc = "Telescope [G]oto [D]efinition",
		-- },
		-- {
		-- 	"gr",
		-- 	function()
		-- 		require("telescope.builtin").lsp_references()
		-- 	end,
		-- 	desc = "Telescope [G]oto [R]eferences",
		-- },
		-- {
		-- 	"gi",
		-- 	function()
		-- 		require("telescope.builtin").lsp_implementations()
		-- 	end,
		-- 	desc = "Telescope [G]oto [I]mplementations",
		-- },
		-- {
		-- 	"gt",
		-- 	function()
		-- 		require("telescope.builtin").lsp_type_definitions({ initial_mode = "insert" })
		-- 	end,
		-- 	desc = "Telescope [G]oto [T]ype Defnitions",
		-- },
		{
			"<leader>km",
			function()
				require("telescope.builtin").keymaps()
			end,
			desc = "Telescope List All [K]ey[M]aps",
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
