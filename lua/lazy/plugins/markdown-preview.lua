return {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	ft = { "markdown" },
	build = "cd app && npm install && git restore .",
	keys = { { "mp", "<cmd>MarkdownPreviewToggle<cr>", desc = "[M]arkdown [P]review" } },
	config = function()
		vim.g.mkdp_browser = "/usr/bin/chromium"
	end,
}
