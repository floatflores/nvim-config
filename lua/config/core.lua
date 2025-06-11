vim.lsp.enable({
	"clangd",
	"lua_ls",
	-- "basedpyright",
	"pylsp",
	"ruff",
	"marksman",
	"jdtls",
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
	virtual_text = {
		current_line = true,
	},
	update_in_insert = true,
	float = {
		severity_sort = true,
		source = "if_many",
		border = "single",
	},
	severity_sort = true,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.INFO] = "",
			[vim.diagnostic.severity.HINT] = "",
		},
		-- text = {
		-- 	[vim.diagnostic.severity.ERROR] = "✘",
		-- 	[vim.diagnostic.severity.WARN] = "▲",
		-- 	[vim.diagnostic.severity.HINT] = "⚑",
		-- 	[vim.diagnostic.severity.INFO] = "»",
		-- },
	},
})
