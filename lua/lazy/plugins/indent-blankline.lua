return {
	"lukas-reineke/indent-blankline.nvim",
	lazy = true,
	ft = { "c", "cpp", "java", "lua", "python", "json", "markdown" },
	opts = {
		scope = {
			show_start = false,
			show_end = false,
		},
	},
	main = "ibl",
	config = true,
}
