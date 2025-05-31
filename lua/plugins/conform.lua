return {
	"stevearc/conform.nvim",
	event = "VeryLazy",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				c = { "clang-format" },
				cpp = { "clang-format" },
				lua = { "stylua" },
				python = { "isort", "yapf" },
				sh = { "shfmt" },
			},
			-- format_on_save = {
			-- 	timeout_ms = 5000,
			-- 	lsp_fallback = "fallback",
			-- },
			vim.keymap.set({ "n", "v" }, "<leader>mp", function()
				require("conform").format({
					timeout_ms = 5000,
					lsp_fallback = "fallback",
				})
			end, { desc = "Trigger to format current file" }),
		})
	end,
}
