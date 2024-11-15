return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local function get_day()
			return os.date("%d %b %Y")
		end

		local function get_current_time()
			return os.date("%H:%M:%S")
		end

		require("lualine").setup({
			options = {
				refresh = {
					statusline = 500,
					tabline = 500,
					winbar = 500,
				},
			},
			sections = {
				lualine_c = { "filename" },
				lualine_x = { get_day, get_current_time, "encoding", "filetype" },
			},
		})
	end,
}
