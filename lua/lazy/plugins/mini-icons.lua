return {
	"echasnovski/mini.icons",
	event = "VeryLazy",
	opts = {},
	init = function()
		package.preload["nvim-web-devicons"] = function()
			require("mini.icons").mock_nvim_web_devicons()
			return package.loaded["nvim-web-devicons"]
		end
	end,
}
