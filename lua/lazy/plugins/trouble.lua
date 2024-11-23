return {
	-- lint and error signs
	"folke/trouble.nvim",
	keys = {
		{ "<leader>A", "<cmd>Trouble diagnostics toggle focus=true<cr>", desc = "Diagnostics (Trouble)" },
		{
			"<leader>a",
			"<cmd>Trouble diagnostics toggle focus=true filter.buf=0<cr>",
			desc = "Buffer Diagnostics (Trouble)",
		},
		{ "<F1>", "<cmd>Trouble symbols toggle<cr>", desc = "Symbols (Trouble)" },
		{ "<leader>cs", "<cmd>Trouble lsp toggle<cr>", desc = "LSP references/definitions/... (Trouble)" },
		{ "<leader>xL", "<cmd>Trouble loclist toggle<cr>", desc = "Location List (Trouble)" },
		{ "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List (Trouble)" },
		{
			"[q",
			function()
				if require("trouble").is_open() then
					require("trouble").prev({ skip_groups = true, jump = true })
				else
					local ok, err = pcall(vim.cmd.cprev)
					if not ok then
						vim.notify(err, vim.log.levels.ERROR)
					end
				end
			end,
			desc = "Previous Trouble/Quickfix Item",
		},
		{
			"]q",
			function()
				if require("trouble").is_open() then
					require("trouble").next({ skip_groups = true, jump = true })
				else
					local ok, err = pcall(vim.cmd.cnext)
					if not ok then
						vim.notify(err, vim.log.levels.ERROR)
					end
				end
			end,
			desc = "Next Trouble/Quickfix Item",
		},
	},
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
