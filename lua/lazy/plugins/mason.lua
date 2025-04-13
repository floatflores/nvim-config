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
				border = "single",
				width = 0.7,
				height = 0.7,
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
			"marksman", -- markdown-lsp
			"texlab", -- laTex lsp
			"basedpyright", -- python-lsp
			"lua-language-server", -- lua-lsp
			"bash-language-server", -- bash-lsp
		}
		local linter_list = {
			"ruff", -- python linter
			"cmakelint", -- cmake linter
			"luacheck", -- lua linter
			"jsonlint", -- json linter
			"shellcheck", -- shell linter
		}
		local formatter_list = {
			"clang-format", -- c/c++ formatter
			"stylua", -- lua formatter
			"isort", -- python formatter
			"black",
			"autoflake", -- python formatter
			"cmakelang", -- cmake formatter
			"fixjson", -- json formatter
			"mdformat", -- markdown formatter
			"beautysh", -- sh formatter
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
