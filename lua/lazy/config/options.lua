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
opt.modifiable = true
opt.wrap = false

opt.termguicolors = true
opt.signcolumn = "yes"

vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })

vim.cmd("filetype plugin indent on")
