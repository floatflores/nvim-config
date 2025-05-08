return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			auto_install = true,
			ensure_installed = {
				"c",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"python",
				"cpp",
				"javascript",
				"html",
				"java",
				"sql",
			},
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
			disable = function(lang, bufnr)
				return vim.api.nvim_buf_line_count(bufnr) > 5000
			end,
		})
	end,
}
