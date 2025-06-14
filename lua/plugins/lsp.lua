return {
	{
		"mason-org/mason.nvim",
		event = "VeryLazy",
		opts = {
			ensure_installed = {
				-- lsp
				"lua-language-server",
				"clangd",
				"texlab",
				"basedpyright",
				"bash-language-server",
				"marksman",
				"jdtls",
				-- linter
				"ruff",
				"cmakelint",
				"luacheck",
				"shellcheck",
				-- formater
				"clang-format",
				"stylua",
				"yapf",
				"isort",
				"cmakelang",
				"prettierd",
				"shfmt",
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
				if not mr.is_installed(tool) then
					vim.cmd("MasonInstall " .. tool)
				end
			end
		end,
	},
	{
		"neovim/nvim-lspconfig",
		ft = { "lua", "python", "c", "cpp", "md", "json", "java" },
		dependencies = {
			{ "mason-org/mason-lspconfig.nvim", config = true },
		},
	},
}
