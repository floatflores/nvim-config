return {
	"mfussenegger/nvim-lint",
	event = "VeryLazy",
	config = function()
		local lint = require("lint")
		lint.linters_by_ft = {
			python = { "ruff" },
			sh = { "shellcheck" },
			cmake = { "cmakelint" },
			markdown = { "markdownlint" },
		}

		-- Debounce per buffer: lint at most once per 500ms after InsertLeave
		-- or BufWritePost. nvim-lint cancels the previous process itself.
		local timers = {}
		local function schedule_lint(bufnr)
			local timer = timers[bufnr]
			if not timer then
				timer = assert(vim.uv.new_timer())
				timers[bufnr] = timer
			end
			timer:stop()
			timer:start(
				500,
				0,
				vim.schedule_wrap(function()
					if vim.api.nvim_buf_is_valid(bufnr) then
						vim.api.nvim_buf_call(bufnr, lint.try_lint)
					end
				end)
			)
		end

		local group = vim.api.nvim_create_augroup("lint", { clear = true })
		vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
			group = group,
			callback = function(args)
				schedule_lint(args.buf)
			end,
		})

		vim.api.nvim_create_autocmd("BufDelete", {
			group = group,
			callback = function(args)
				local timer = timers[args.buf]
				if timer then
					timer:stop()
					timer:close()
					timers[args.buf] = nil
				end
			end,
		})

		vim.keymap.set("n", "<leader>ml", function()
			lint.try_lint()
		end, { desc = "Trigger to lint current file" })
	end,
}
