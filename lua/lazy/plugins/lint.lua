return {
	"mfussenegger/nvim-lint",
	event = "VeryLazy",
	config = function()
		local lint = require("lint")
		lint.linters.clang_tidy = {
			name = "clang-tidy",
			cmd = "clang-tidy",
			stdin = false,
			args = {
				"--quiet",
			},
			ignore_exitcode = true,
			parser = function(output, bufnr)
				local diagnostics = {}
				for _, line in ipairs(vim.split(output, "\n")) do
					local parts = vim.fn.matchlist(line, [[\v(.+):(%d):(%d):\s+(%w+):\s+(.+)]])
					if #parts >= 6 then
						local file = parts[2]
						local lnum = tonumber(parts[3]) - 1
						local col = tonumber(parts[4]) - 1
						local severity = parts[5]:lower() == "warning" and vim.diagnostic.severity.WARN
							or vim.diagnostic.severity.ERROR
						local message = parts[6]
						table.insert(diagnostics, {
							lnum = lnum,
							col = col,
							severity = severity,
							message = message,
							source = "clang-tidy",
							bufnr = bufnr,
						})
					end
				end
				return diagnostics
			end,
		}
		lint.linters_by_ft = {
			c = { "clang_tidy" },
			cpp = { "clang_tidy" },
			python = { "flake8" },
			cmake = { "cmakelint" },
			lua = { "luacheck" },
			markdown = { "vale" },
			json = { "jsonlint" },
		}
		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
		vim.api.nvim_create_autocmd({ "BufWritePost", "TextChanged" }, {
			group = lint_augroup,
			callback = function()
				vim.defer_fn(lint.try_lint, 500)
			end,
		})
		vim.keymap.set("n", "<leader>ml", function()
			lint.try_lint()
		end, { desc = "Trigger to lint current file" })
	end,
}
