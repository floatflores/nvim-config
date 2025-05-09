return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "helix",
		win = {
			title = false,
			width = 0.5,
		},
		expand = function(node)
			return not node.desc
		end,
	},
}
