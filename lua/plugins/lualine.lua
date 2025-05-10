return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			refresh = {
				statusline = 500,
				tabline = 500,
				winbar = 500,
			},
			theme = "catppuccin",
			always_divide_middle = false,
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
		},
		sections = {
			lualine_c = { { "filename", path = 1 } },
			lualine_x = { "encoding", "filetype" },
		},
	},
}
