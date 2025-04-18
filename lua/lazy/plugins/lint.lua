return {
	"mfussenegger/nvim-lint",
	event = "VeryLazy",
	config = function()
		local lint = require("lint")
		lint.linters_by_ft = {
			python = { "ruff" },
			cmake = { "cmakelint" },
			lua = { "luacheck" },
			json = { "jsonlint" },
			sh = { "shellcheck" },
		}
		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
		vim.api.nvim_create_autocmd({ "BufWritePost", "TextChanged" }, {
			group = lint_augroup,
			callback = function()
				vim.defer_fn(lint.try_lint, 2000)
			end,
		})
		vim.keymap.set("n", "<leader>ml", function()
			lint.try_lint()
		end, { desc = "Trigger to lint current file" })
	end,
}
