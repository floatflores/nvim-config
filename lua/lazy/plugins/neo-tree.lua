return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	opts = {
		open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
		filesystem = {
			hide_dotfiles = false,
			hide_gitignored = false,
			bind_to_cwd = false,
			follow_current_file = { enabled = true },
			use_libuv_file_watcher = true,
		},
		default_component_configs = {
			indent = {
				with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
				expander_collapsed = "",
				expander_expanded = "",
				expander_highlight = "NeoTreeExpander",
			},
			git_status = {
				symbols = {
					unstaged = "󰄱",
					staged = "󰱒",
				},
			},
		},
	},
	keys = {
		{
			"<leader>e",
			function()
				require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
			end,
			desc = "Explorer Neotree (Current Dir)",
		},
		{
			"<leader>E",
			function()
				require("neo-tree.command").execute({ toggle = true, dir = "/" })
			end,
			desc = "Explorer Neotree (Root Dir)",
		},
		{
			"<leader>ngs",
			function()
				require("neo-tree.command").execute({ toggle = true, source = "git_status" })
			end,
			desc = "Git Explorer",
		},
		{
			"<leader>nb",
			function()
				require("neo-tree.command").execute({ toggle = true, source = "buffers" })
			end,
			desc = "Buffer Explorer",
		},
	},
}
