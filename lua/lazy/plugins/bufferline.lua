return {
	"akinsho/bufferline.nvim",
	event = "VeryLazy",
	dependencies = {
		"famiu/bufdelete.nvim",
	},
	keys = {
		{ "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
		{ "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
		{ "<leader>bp", "<cmd>BufferLineTogglePin<cr>", desc = "Pin Current Buffer" },
		{ "<leader>bcl", "<cmd>BufferLineCloseLeft<cr>", desc = "Close Left Buffer" },
		{ "<leader>bcr", "<cmd>BufferLineCloseRight<cr>", desc = "Close Right Buffer" },
		{ "<leader>bco", "<cmd>BufferLineCloseOthers<cr>", desc = "Close other Buffer" },
		{ "<leader>bcP", "<cmd>BufferLineClose ungrouped<cr>", desc = "Close Unpinned Buffer" },
	},
	opts = {
		options = {
			close_command = function(bufnum)
				require("bufdelete").bufdelete(bufnum, true)
			end,
			diagnostics = "nvim_lsp",
			-- custom_filter = function(buf_number, buf_numbers)
			-- if vim.bo[buf_number].buftype == "terminal" then
			-- return false
			-- end
			-- end,
			diagnostics_indicator = function(count, level)
				local icon = level:match("error") and " " or " "
				return " " .. icon .. count
			end,
			sort_by = "insert_after_current",
			offsets = {
				{
					filetype = "Neotree",
					text = "File Explorer",
					text_align = "left",
					separator = true,
				},
			},
		},
	},
	main = "bufferline",
	config = true,
}
