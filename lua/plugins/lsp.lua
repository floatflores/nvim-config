return {
	{
		"mason-org/mason.nvim",
		event = "VeryLazy",
		opts = {
			-- lsp
			ensure_installed = {
				"lua-language-server",
				"clangd",
				-- "basedpyright",
				"python-lsp-server",
				"bash-language-server",
				"cmake-language-server",
				"marksman",
				"jdtls",
				"texlab",
				"glsl_analyzer",
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
	{
		"neovim/nvim-lspconfig",
		ft = { "lua", "c", "cpp", "python", "java", "markdown", "cmake", "tex" },
		dependencies = { { "mason-org/mason-lspconfig.nvim", config = true } },
	},
}
