return {
	"mfussenegger/nvim-lint",
	lazy = true,
	ft = { "python", "c", "cpp", "lua", "json", "javascript", "html", "cmake", "sh", "markdown" },
	config = function()
		local lint = require("lint")
		lint.linters_by_ft = {
			python = { "flake8" },
			c = { "cpplint" },
			cpp = { "cpplint" },
			lua = { "luacheck" },
			json = { "jsonlint" },
			html = { "htmlhint" },
			markdown = { "markdownlint" },
			cmake = { "cmakelint" },
			javascript = { "eslint_d" },
			sh = { "shellcheck" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})

		vim.keymap.set("n", "<leader>l", function()
			lint.try_lint()
		end, { desc = "Trigger linting for current file" })
	end,
}
