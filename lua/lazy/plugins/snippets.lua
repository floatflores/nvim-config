return {
	"L3MON4D3/LuaSnip", -- auto-completion cant work without this
	event = "LspAttach",
	version = "v2.*",
	-- install jsregexp (optional!).
	-- build = "make install_jsregexp",
	dependencies = {
		"rafamadriz/friendly-snippets",
	},
	config = function()
		local function lazy_load_snippets()
			require("luasnip.loaders.from_vscode").lazy_load()
		end
		vim.api.nvim_create_autocmd({ "InsertEnter", "BufReadPost" }, { callback = lazy_load_snippets })
	end,
}
