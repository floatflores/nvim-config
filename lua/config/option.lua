local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

opt.showcmd = true
opt.cursorline = true
opt.showmode = false

opt.tabstop = 4
opt.shiftwidth = 4

opt.breakindent = true
opt.undofile = true
opt.autoindent = true
opt.expandtab = true

opt.ignorecase = true
opt.smartcase = true
opt.modifiable = true
opt.wrap = true

opt.termguicolors = true
opt.signcolumn = "yes"

opt.mouse = "a"
opt.clipboard = "unnamedplus"

-- vim.opt.list = true
-- vim.opt.listchars = { tab = ">-", trail = "-" }

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
	float = {
		severity_sort = true,
		source = "if_many",
		border = "single",
	},
	severity_sort = true,
})
