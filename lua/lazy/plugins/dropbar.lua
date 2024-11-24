return {
	"Bekaboo/dropbar.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
	},
	opts = {
		bar = {
			enable = true,
			update_debounce = 20,
		},
	},
	config = true,
}
