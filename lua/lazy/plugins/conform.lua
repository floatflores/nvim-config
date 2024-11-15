return {
	"stevearc/conform.nvim",
	lazy = true,
	ft = { "lua", "python", "c", "cpp", "java", "json", "javascript", "toml", "html", "markdown" },
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				python = { "autopep8" },
				c = { "clang-format" },
				cmake = { "cmakelang" },
				cpp = { "clang-format" },
				lua = { "stylua" },
				java = { "clang-format" },
				javascript = { "clang-format" },
				json = { "fixjson" },
				markdown = { "mdformat" },
				["_"] = { "prettier" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			},
      vim.keymap.set({ "n", "v" }, "<leader>mp", function()
        require("conform").format({
          lsp_fallback = true,
          async = false,
          timeout_ms = 500,
        })
      end, { desc = "Format file or range (in visual mode)" }),
		})
	end,
}
