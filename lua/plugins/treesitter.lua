return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	branch = "main",
	main = "nvim-treesitter",
	init = function()
		vim.api.nvim_create_autocmd("FileType", {
			callback = function()
				pcall(vim.treesitter.start)
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})
		local ensureInstalled = {
			"bash",
			"c",
			"cmake",
			"cpp",
			"css",
			"glsl",
			"html",
			"java",
			"javascript",
			"json",
			"latex", -- needs tree-sitter-cli >= 0.26.1 for ABI 15
			"lua",
			"markdown",
			"markdown_inline",
			"python",
			"query",
			"rust",
			"sql",
			"toml",
			"tsx",
			"typescript",
			"vim",
			"vimdoc",
			"xml",
			"yaml",
			"zig",
		}
		-- Only look at actual parser binaries; `get_installed()` also counts
		-- queries, which can make a half-finished install look complete.
		local alreadyInstalled = require("nvim-treesitter.config").get_installed("parsers")
		local parsersToInstall = vim.iter(ensureInstalled)
			:filter(function(parser)
				return not vim.tbl_contains(alreadyInstalled, parser)
			end)
			:totable()
		if #parsersToInstall > 0 then
			require("nvim-treesitter").install(parsersToInstall, { force = true })
		end
	end,
}
