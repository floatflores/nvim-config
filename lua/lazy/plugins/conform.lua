return {
	"stevearc/conform.nvim",
	event = "VeryLazy",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				c = { "clang-format" },
				cpp = { "clang-format" },
				lua = { "stylua" },
				cmake = { "cmakelang" },
				markdown = { "mdformat" },
				json = { "fixjson" },
				python = { "black", "autoflake" },
				["_"] = { "prettier" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = "fallback",
			},
			vim.keymap.set({ "n", "v" }, "<leader>mp", function()
				require("conform").format({
					timeout_ms = 500,
					lsp_fallback = "fallback",
				})
			end, { desc = "Trigger to format current file" }),
		})
	end,
}
