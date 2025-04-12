local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

opt.showcmd = true
opt.cursorline = true
opt.showmode = false

opt.tabstop = 2
opt.shiftwidth = 2

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

opt.updatetime = 250
opt.timeoutlen = 300

vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })

vim.keymap.set("n", "<ESC>", "<cmd>nohlsearch<CR>")
-- vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = " Goto previous [D]iagnostic message" })
-- vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = " Goto next [D]iagnostic message" })

-- Highlight whtn yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("Highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- undotree keymap
vim.keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<cr>", { desc = "[u]ndotree toggle" })
