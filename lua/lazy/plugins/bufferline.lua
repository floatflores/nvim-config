return {
	"akinsho/bufferline.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"famiu/bufdelete.nvim",
	},
	keys = {
		{ "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
		{ "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
		{ "<leader>bp", "<cmd>BufferLineTogglePin<cr>", desc = "[B]uffer [P]in" },
		{ "<leader>bcl", "<cmd>BufferLineCloseLeft<cr>", desc = "[B]uffer [C]lose [L]eft" },
		{ "<leader>bcr", "<cmd>BufferLineCloseRight<cr>", desc = "[B]uffer [C]lose [R]ight" },
		{ "<leader>bco", "<cmd>BufferLineCloseOthers<cr>", desc = "[B]uffer [C]lose [O]thers" },
		{ "<leader>bcP", "<cmd>BufferLineClose ungrouped<cr>", desc = "[B]uffer [C]lose un[P]inned" },
		{ "gb0", "<cmd>BufferLineGoToBuffer -1<cr>", desc = "[G]oto [B]uffer [0]" },
	},
	config = function()
		local bufferline = require("bufferline")
		bufferline.setup({
			options = {
				close_command = function(bufnum)
					require("bufdelete").bufdelete(bufnum, true)
				end,
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
				-- numbers = function(opts)
				-- 	return string.format("%s", opts.ordinal)
				-- end,
				diagnostics_indicator = function(count, level)
					local icon = level:match("error") and " " or " "
					return " " .. icon .. count
				end,
			},
		})
	end,
}
