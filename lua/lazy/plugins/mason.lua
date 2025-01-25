return {
	"williamboman/mason.nvim",
	event = "VeryLazy",
	dependencies = {
		{
			"williamboman/mason-lspconfig.nvim",
			opts = {},
		},
		"mason-org/mason-registry",
	},
	config = function()
		require("mason").setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})
		local lsp_list = {
			"clangd", -- c/c++ lsp
			"json-lsp", -- json-lsp
			"ltex-ls", -- markdown-lsp for latex check
			"markdown-oxide", -- markdown-lsp for linting
			"pyright", -- python-lsp
			"lua-language-server", -- lua-lsp
		}
		local linter_list = {
			"cpplint", -- c/c++ linter
			"flake8", -- python linter
			"cmakelint", -- cmake linter
			"luacheck", -- lua linter
			"vale", -- latex/markdown linter
			"jsonlint", -- json linter
		}
		local formatter_list = {
			"clang-format", -- c/c++ formatter
			"stylua", -- lua formatter
			"black", -- python formatter
			"autoflake", -- python formatter
			"cmakelang", -- cmake formatter
			"fixjson", -- json formatter
			"mdformat", -- markdown formatter
			"prettier",
		}
		local mr = require("mason-registry")
		for _, lsp in ipairs(lsp_list) do
			if not mr.is_installed(lsp) then
				vim.notify("Mason::Installing missing LSP...")
				vim.cmd("MasonInstall " .. lsp)
			end
		end

		for _, linter in ipairs(linter_list) do
			if not mr.is_installed(linter) then
				vim.notify("Mason::Installing missing Linter...")
				vim.cmd("MasonInstall " .. linter)
			end
		end

		for _, formatter in ipairs(formatter_list) do
			if not mr.is_installed(formatter) then
				vim.notify("Mason::Installing missing Formatter...")
				vim.cmd("MasonInstall " .. formatter)
			end
		end
	end,
}
