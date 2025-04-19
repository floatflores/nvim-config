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
				markdown = { "prettierd", "cbfmt" },
				json = { "prettierd" },
				python = { "isort", "yapf" },
				toml = { "taplo" },
				sh = { "shfmt" },
			},
			format_on_save = {
				timeout_ms = 2000,
				lsp_fallback = "fallback",
			},
			formatters = {
				my_formatter = {
					cmd = "clang-format",
					args = { "--style=file:~/.local/configuration/.clang-format" },
				},
			},
			-- formatters =
			vim.keymap.set({ "n", "v" }, "<leader>mp", function()
				require("conform").format({
					timeout_ms = 2000,
					lsp_fallback = "fallback",
				})
			end, { desc = "Trigger to format current file" }),
		})
	end,
}
