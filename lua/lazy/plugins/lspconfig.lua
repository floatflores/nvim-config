return {
	"neovim/nvim-lspconfig",
	ft = { "lua", "python", "c", "cpp" },
	dependencies = { { "williamboman/mason-lspconfig.nvim", config = true } },
	config = function()
		require("lspconfig").lua_ls.setup({})
		require("lspconfig").pyright.setup({})
		require("lspconfig").clangd.setup({})
	end,
}
