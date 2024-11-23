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
		local plugins = {
			"clangd",
			"cmakelang",
			"clang-format",
			"lua-language-server",
			"luacheck",
			"stylua",
			"prettier",
			"autopep8",
			"flake8",
			"pyright",
			"fixjson",
			"jsonlint",
			"eslint_d",
			"markdownlint",
			"htmlhint",
			"cpplint",
			"mdformat",
			"shellcheck",
			"cmakelint",
		}
		local mr = require("mason-registry")
		for _, plugin in ipairs(plugins) do
			if not mr.is_installed(plugin) then
				-- local package = mr.get_package(plugin)
				-- package.install()
				print("installing from mason plugin: " .. plugin)
				vim.cmd("MasonInstall " .. plugin)
				-- else
				--   print(plugin .. "is installed, skip..")
			end
		end
	end,
}
