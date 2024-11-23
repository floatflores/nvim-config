return {
	"utilyre/barbecue.nvim",
	lazy = false,
	name = "barbecue",
	version = "*",
	dependencies = {
		"SmiteshP/nvim-navic",
		"nvim-tree/nvim-web-devicons", -- optional dependency
	},
	config = function()
		vim.opt.updatetime = 200
		require("barbecue").setup({
			create_autocmd = false,
		})
		local winbar_augroup = vim.api.nvim_create_augroup("winbar", { clear = true })
		vim.api.nvim_create_autocmd({ "WinScrolled", "BufWinEnter", "CursorHold", "InsertLeave" }, {
			group = winbar_augroup,
			callback = function()
				require("barbecue.ui").update()
			end,
		})
	end,
}
