return {
	{
		"mason-org/mason.nvim",
		event = "VeryLazy",
		dependencies = {
			"neovim/nvim-lspconfig",
			"mason-org/mason-lspconfig.nvim",
		},
		opts = {
			-- lsp
			ensure_installed = {
				"lua-language-server",
				"clangd",
				"texlab",
				-- "basedpyright",
				"python-lsp-server",
				"bash-language-server",
				"marksman",
				"jdtls",
			},
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
		},
		config = function(_, opts)
			require("mason").setup(opts)
			local mr = require("mason-registry")
			for _, tool in ipairs(opts.ensure_installed) do
				local success, package = pcall(mr.get_package, tool)
				if success and not package:is_installed() then
					vim.cmd("MasonInstall " .. package.name)
				end
			end
		end,
	},
}
