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
opt.wrap = false

opt.termguicolors = true
opt.signcolumn = "yes"

opt.mouse = "a"
opt.clipboard = "unnamedplus"

-- Let jumplist to be stacked
opt.jumpoptions = "stack"

-- UI / responsiveness
opt.updatetime = 250
opt.timeoutlen = 300
opt.scrolloff = 4
opt.sidescrolloff = 8
opt.splitright = true
opt.splitbelow = true
opt.confirm = true
opt.inccommand = "split"
opt.pumheight = 12
opt.winborder = "single"
-- opt.list = true
-- opt.listchars = { tab = ">-", trail = "-" }

-- Keep prose readable, but don't wrap code by default.
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "markdown", "text", "gitcommit", "tex", "plaintex" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.linebreak = true
	end,
	desc = "Enable wrapping for prose filetypes",
})

-- Makefiles require real tabs.
vim.api.nvim_create_autocmd("FileType", {
	pattern = "make",
	callback = function()
		vim.opt_local.expandtab = false
		vim.opt_local.tabstop = 8
		vim.opt_local.shiftwidth = 8
	end,
	desc = "Use tabs in Makefiles",
})
