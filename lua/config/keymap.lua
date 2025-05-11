vim.keymap.set("n", "<Tab>", "<cmd>lua MiniFiles.open()<CR>", { desc = "Open Mini.File" })

vim.keymap.set("n", "<leader>gp", "<CMD>lua MiniDiff.toggle_overlay()<CR>")
vim.keymap.set("n", "<leader>l", function()
	require("lsp_lines").toggle()
end)
vim.keymap.set("n", "<ESC>", "<CMD>nohlsearch<CR>")

vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)
