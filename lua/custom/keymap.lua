vim.keymap.set("n", "<Tab>", "<cmd>lua MiniFiles.open()<CR>", { desc = "Open Mini.File" })

vim.keymap.set("n", "<leader>gp", "<CMD>lua MiniDiff.toggle_overlay()<CR>", { desc = "Toggle Diff Overlay" })

vim.keymap.set("n", "<leader>l", function()
	require("tiny-inline-diagnostic").toggle()
end, { desc = "Toggle Inline Diagnostics" })

vim.keymap.set("n", "<ESC>", "<CMD>nohlsearch<CR>")

vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Lsp Rename" })
vim.keymap.set({ "n", "v" }, "<leader>qf", function()
	require("conform").format({ async = true, lsp_format = "fallback", timeout_ms = 5000 })
end, { desc = "Format Buffer (conform, LSP fallback)" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Lsp Code Action" })
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Open Diagnostic Window" })

vim.keymap.set("n", "]d", function()
	vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "Next Diagnostic" })
vim.keymap.set("n", "[d", function()
	vim.diagnostic.jump({ count = -1, float = true })
end, { desc = "Previous Diagnostic" })
