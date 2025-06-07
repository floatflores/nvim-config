return {
	"akinsho/bufferline.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{ "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
		{ "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
		{ "<leader>bp", "<cmd>BufferLineTogglePin<cr>", desc = "[B]uffer [P]in" },
		{ "<leader>bcl", "<cmd>BufferLineCloseLeft<cr>", desc = "[B]uffer [C]lose [L]eft" },
		{ "<leader>bcr", "<cmd>BufferLineCloseRight<cr>", desc = "[B]uffer [C]lose [R]ight" },
		{ "<leader>bco", "<cmd>BufferLineCloseOthers<cr>", desc = "[B]uffer [C]lose [O]thers" },
		{ "<leader>bcP", "<cmd>BufferLineClose ungrouped<cr>", desc = "[B]uffer [C]lose un[P]inned" },
	},
	config = function()
		local bufferline = require("bufferline")
		bufferline.setup({
			options = {
				diagnostics = "nvim_lsp",
				style_preset = {
					bufferline.style_preset.no_italic,
					bufferline.style_preset.no_bold,
				},
				sort_by = "insert_after_current",
				offsets = {
					{
						filetype = "Neotree",
						text = "File Explorer",
						text_align = "left",
						separator = true,
					},
				},
				diagnostics_indicator = function(count, level)
					local icon = level:match("error") and " " or " "
					return " " .. icon .. count
				end,
			},
		})
	end,
}
