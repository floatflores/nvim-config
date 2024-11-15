local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

opt.showcmd = true
opt.cursorline = true

opt.tabstop = 2
opt.shiftwidth = 2
opt.autoindent = true
opt.expandtab = true

opt.ignorecase = true
opt.smartcase = true

opt.termguicolors = true
opt.signcolumn = "yes"
vim.cmd("filetype plugin indent on")
