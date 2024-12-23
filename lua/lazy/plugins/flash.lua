return {
	"folke/flash.nvim",
	event = "VeryLazy",
	---@type Flash.Config
	opts = {},
	keys = {
		{
			"<leader>ss",
			mode = { "n", "x", "o" },
			function()
				require("flash").jump()
			end,
			desc = "Flash",
		},
		{
			"<leader>ft",
			mode = { "n", "x", "o" },
			function()
				require("flash").treesitter()
			end,
			desc = "Flash Treesitter",
		},
		-- {
		-- 	"<leader>yr",
		-- 	mode = { "o", "n" },
		-- 	function()
		-- 		require("flash").remote()
		-- 	end,
		-- 	desc = "Remote Flash",
		-- },
		{
			"<leader>sc",
			mode = { "n", "o", "x" },
			function()
				require("flash").treesitter_search()
			end,
			desc = "Treesitter Search",
		},
		-- {
		-- 	"<c-s>",
		-- 	mode = { "c", "n" },
		-- 	function()
		-- 		require("flash").toggle()
		-- 	end,
		-- 	desc = "Toggle Flash Search",
		-- },
	},
}
