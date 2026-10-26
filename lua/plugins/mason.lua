-- Single place for everything that should be installed by Mason.
-- Add the Mason package name to the matching group below.
-- Server behavior/config lives in lsp/*.lua; the enable list is in lua/custom/core.lua.
return {
	{
		"mason-org/mason.nvim",
		opts = {
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
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "mason-org/mason.nvim" },
		opts = {
			ensure_installed = {
				-- Language servers
				"bash-language-server",
				"clangd",
				"glsl_analyzer",
				"jdtls",
				"lua-language-server",
				"marksman",
				"neocmakelsp",
				"python-lsp-server",
				"ruff",
				"texlab",
				"zls",
				-- Formatters
				"clang-format",
				"prettierd",
				"shfmt",
				"stylua",
				"tex-fmt",
				"xmlformatter",
				-- Linters
				"cmakelint",
				"markdownlint",
				"shellcheck",
				-- Debug adapters
				"codelldb",
			},
			run_on_start = true,
		},
	},
}
