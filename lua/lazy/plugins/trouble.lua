return {
	-- lint and error signs
	"folke/trouble.nvim",
	lazy = true,
	ft = { "lua", "python", "java", "cpp", "c", "json", "markdown", "toml", "yaml", "cmake" },
	config = function()
		require("trouble").setup({
			icons = {
				indent = {
					top = "│ ",
					middle = "├╴",
					-- last          = "└╴",
					last = "╰╴",
					fold_open = " ",
					fold_closed = " ",
					ws = "  ",
				},
				folder_closed = " ",
				folder_open = " ",
				kinds = {
					Array = " ",
					Boolean = "󰨙 ",
					Class = " ",
					Constant = "󰏿 ",
					Constructor = " ",
					Enum = " ",
					EnumMember = " ",
					Event = " ",
					Field = " ",
					File = " ",
					Function = "󰊕 ",
					Interface = " ",
					Key = " ",
					Method = "󰊕 ",
					Module = " ",
					Namespace = "󰦮 ",
					Null = " ",
					Number = "󰎠 ",
					Object = " ",
					Operator = " ",
					Package = " ",
					Property = " ",
					String = " ",
					Struct = "󰆼 ",
					TypeParameter = " ",
					Variable = "󰀫 ",
				},
			},
			function()
				vim.cmd([[
        augroup trouble_setlocal
        autocmd!
        autocmd FileType trouble setlocal wrap
        augroup END
      ]])
			end,
		})
	end,
}
