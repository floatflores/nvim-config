vim.lsp.enable({
	"bashls",
	"clangd",
	"lua_ls",
	"pylsp",
	"ruff",
	"jdtls",
	"marksman",
	"neocmakelsp",
	"texlab",
	"glsl_analyzer",
	"rust_analyzer",
	"zls",
})

-- Highlight with yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("Highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
vim.diagnostic.config({
	-- Inline diagnostics are rendered by tiny-inline-diagnostic.nvim.
	-- `virtual_text` cannot wrap long messages inside the window.
	virtual_text = false,
	update_in_insert = false,
	float = {
		severity_sort = true,
		source = "if_many",
		border = "single",
		wrap = true,
	},
	severity_sort = true,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.INFO] = "",
			[vim.diagnostic.severity.HINT] = "",
		},
	},
})
