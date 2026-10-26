return {
	"stevearc/conform.nvim",
	event = "VeryLazy",
	opts = {
		formatters_by_ft = {
			c = { "clang-format" },
			cpp = { "clang-format" },
			css = { "prettierd" },
			graphql = { "prettierd" },
			html = { "prettierd" },
			javascript = { "prettierd" },
			javascriptreact = { "prettierd" },
			json = { "prettierd" },
			jsonc = { "prettierd" },
			lua = { "stylua" },
			markdown = { "prettierd" },
			python = { "ruff_organize_imports", "ruff_format" },
			rust = { "rustfmt" },
			scss = { "prettierd" },
			sh = { "shfmt" },
			tex = { "tex-fmt" },
			typescript = { "prettierd" },
			typescriptreact = { "prettierd" },
			vue = { "prettierd" },
			xml = { "xmlformatter" },
			yaml = { "prettierd" },
		},
		-- Use the LSP formatter when no conform formatter is available
		-- (or fails), so <leader>qf also works for servers like rust-analyzer.
		default_format_opts = {
			lsp_format = "fallback",
		},
		-- Autoformat after save
		-- format_on_save = {
		-- 	timeout_ms = 5000,
		-- 	lsp_format = "fallback",
		-- },
	},
}
