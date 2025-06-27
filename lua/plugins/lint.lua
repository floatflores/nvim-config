return {
	"mfussenegger/nvim-lint",
	event = "VeryLazy",
	config = function()
		local linters = {
			-- linter
			"ruff",
			"cmakelint",
			"luacheck",
			"shellcheck",
			"markdownlint",
		}
		local mr = require("mason-registry")
		for _, tool in ipairs(linters) do
			local success, package = pcall(mr.get_package, tool)
			if success and not package:is_installed() then
				vim.cmd("MasonInstall " .. package.name)
			end
		end

		local lint = require("lint")
		lint.linters_by_ft = {
			python = { "ruff" },
			lua = { "luacheck" },
			sh = { "shellcheck" },
			cmake = { "cmakelint" },
			markdown = { "markdownlint" },
		}
		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
		vim.api.nvim_create_autocmd({ "BufWritePost", "TextChanged" }, {
			group = lint_augroup,
			callback = function()
				vim.defer_fn(lint.try_lint, 5000)
			end,
		})
		vim.keymap.set("n", "<leader>ml", function()
			lint.try_lint()
		end, { desc = "Trigger to lint current file" })
	end,
}
