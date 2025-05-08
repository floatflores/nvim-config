vim.keymap.set("n", "<Tab>", "<cmd>lua MiniFiles.open()<CR>", { desc = "Open Mini.File" })

vim.keymap.set("n", "<leader>gp", "<CMD>lua MiniDiff.toogle_overlay()<CR>")
vim.keymap.set("n", "<ESC>", "<CMD>nohlsearch<CR>")
