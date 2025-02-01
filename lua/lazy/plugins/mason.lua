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
			-- "cpplint", -- c/c++ linter
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

		local tools_list = vim.list_extend(vim.list_extend(lsp_list, linter_list), formatter_list)

		for _, tool in ipairs(tools_list) do
			if not mr.is_installed(tool) then
				vim.cmd("MasonInstall " .. tool)
			end
		end
	end,
}
