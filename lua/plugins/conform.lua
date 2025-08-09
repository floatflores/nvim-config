return {
	"stevearc/conform.nvim",
	event = "VeryLazy",
	config = function()
		local formatters = {
			-- formatter
			"clang-format",
			"stylua",
			"yapf",
			"isort",
			"prettierd",
			"shfmt",
			"codespell",
			"xmlformatter",
			"tex-fmt",
		}
		local mr = require("mason-registry")
		for _, tool in ipairs(formatters) do
			local success, package = pcall(mr.get_package, tool)
			if success and not package:is_installed() then
				vim.cmd("MasonInstall " .. package.name)
			end
		end

		require("conform").setup({
			formatters_by_ft = {
				c = { "clang-format" },
				cpp = { "clang-format" },
				lua = { "stylua" },
				python = { "isort", "yapf" },
				sh = { "shfmt" },
				xml = { "xmlformatter" },
				tex = { "tex-fmt" },
				rust = { "rustfmt" },
				["_"] = { "prettierd" },
			},
			-- Autoformat after save
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
