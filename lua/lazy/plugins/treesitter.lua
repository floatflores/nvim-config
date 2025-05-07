return {
	"nvim-treesitter/nvim-treesitter",
	event = "VeryLazy",
	build = ":TSUpdate",
	dependencies = {
		"p00f/nvim-ts-rainbow",
		"nvim-treesitter/nvim-treesitter-context",
		-- matchup pair of key-word/key-operator
		"andymass/vim-matchup",
	},
	main = "nvim-treesitter.configs",
	opts = {
		highlight = { enable = true },
		indent = { enable = true },
		rainbow = {
			enable = true,
			-- extended_mode = true,
			max_file_lines = nil,
		},
		autotag = { enable = true },
		matchup = { enable = true },
		ensure_installed = {
			"c",
			"cpp",
			"cmake",
			"python",
			"lua",
			"json",
			"sql",
			"bash",
			"toml",
			"yaml",
			"java",
			"markdown",
			"latex",
			"vim",
			"vimdoc",
			"diff",
			"html",
			"javascript",
		},
		disable = function(lang, bufnr)
			return lang == "yaml" and vim.api.nvim_buf_line_count(bufnr) > 5000
		end,
		context = { enable = true },
	},
}
