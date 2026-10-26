return {
	"L3MON4D3/LuaSnip", -- auto-completion cant work without this
	event = "LspAttach",
	version = "v2.*",
	dependencies = {
		"rafamadriz/friendly-snippets",
	},
	config = function()
		require("luasnip").setup({})
		require("luasnip.loaders.from_vscode").lazy_load()
	end,
}
