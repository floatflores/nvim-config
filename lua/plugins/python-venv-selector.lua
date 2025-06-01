return {
	"linux-cultist/venv-selector.nvim",
	event = "BufEnter *.py",
	dependencies = {  "nvim-telescope/telescope.nvim" },
	main = "venv-selector",
	opts = {
		-- Your options go here
		-- name = "venv",
		-- auto_refresh = false
		stay_on_this_version = true,
		path = "$HOME",
	},
	keys = {
		-- Keymap to open VenvSelector to pick a venv.
		{ "<leader>vs", "<cmd>VenvSelect<cr>", desc = "[V]env [S]elect" },
		-- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
		{ "<leader>vc", "<cmd>VenvSelectCached<cr>", desc = "[V]env Select [C]ache" },
	},
}
