vim.keymap.set("n", "<Tab>", "<cmd>lua MiniFiles.open()<CR>", { desc = "Open Mini.File" })

vim.keymap.set("n", "<leader>gp", "<CMD>lua MiniDiff.toggle_overlay()<CR>")

vim.keymap.set("n", "<leader>l", function()
	require("lsp_lines").toggle()
end, { desc = "Toggle Lsp Lines" })

vim.keymap.set("n", "<ESC>", "<CMD>nohlsearch<CR>")

vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Lsp Rename" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Lsp Code Action" })
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Open Diagnostic Window" })
