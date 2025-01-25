return {
	"neovim/nvim-lspconfig",
	ft = { "lua", "python", "c", "cpp", "md", "json" },
	dependencies = { { "williamboman/mason-lspconfig.nvim", config = true } },
	config = function()
		require("lspconfig").lua_ls.setup({})
		require("lspconfig").pyright.setup({})
		require("lspconfig").clangd.setup({})
		require("lspconfig").ltex.setup({})
		require("lspconfig").markdown_oxide.setup({})
		require("lspconfig").jsonls.setup({})
	end,
}
