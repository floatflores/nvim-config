return {
	"L3MON4D3/LuaSnip", -- auto-completion cant work without this
	event = "VeryLazy",
	ft = { "lua", "python", "c", "cpp" },
	dependencies = {
		"rafamadriz/friendly-snippets",
	},
	opts = {
		friendly_snippets = true,
	},
	config = function()
		local function lazy_load_snippets()
			require("luasnip.loaders.from_vscode").lazy_load()
		end
		vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = lazy_load_snippets })
	end,
}
