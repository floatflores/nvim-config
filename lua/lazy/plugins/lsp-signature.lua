return {
	-- Show function signature when you type
	"ray-x/lsp_signature.nvim",
	event = "VeryLazy",
	ft = { "lua", "python", "c", "cpp" },
	config = function()
		require("lsp_signature").setup({
			bind = true,
			doc_lines = 0,
			handler_opts = {
				border = "none",
			},
			floating_window = false,
			floating_window_above_cur_line = true,
			floating_window_off_x = 1,
			floating_window_off_y = 0,
			fix_pos = false,
			hint_enable = true,
			hint_prefix = " ",
			hint_scheme = "Comment",
			hi_parameter = "LspSignatureActiveParameter",
			debug = false,
			toggle_key = "<M-p>",
			toggle_key_flip_floatwin_setting = true,
			select_signature_key = "<M-n>",
			timer_interval = 80,
		})
	end,
}
