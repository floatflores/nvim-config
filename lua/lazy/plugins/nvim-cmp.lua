return {
	"hrsh7th/nvim-cmp",
	version = false, -- last release is way too old
	event = "InsertEnter",
	dependencies = {
		-- This tiny plugin adds vscode-like pictograms to neovim built-in lsp
		"onsails/lspkind-nvim",
		-- nvim-cmp source for neovim"s built-in language server client
		"hrsh7th/cmp-nvim-lsp",
		-- nvim-cmp source for displaying function signatures with the current parameter emphasized
		"hrsh7th/cmp-nvim-lsp-signature-help",
		-- nvim-cmp source for buffer words
		"hrsh7th/cmp-buffer",
		-- nvim-cmp source for filesystem paths
		"hrsh7th/cmp-path",
		-- nvim-cmp source for vim"s cmdline
		"hrsh7th/cmp-cmdline",
		-- spell source for nvim-cmp based on vim"s spellsuggest
		"f3fora/cmp-spell",
		-- nvim-cmp source for math calculation
		"hrsh7th/cmp-calc",
		-- nvim-cmp source for emojis
		"hrsh7th/cmp-emoji",
		-- ripgrep source for nvim-cmp
		"lukas-reineke/cmp-rg",
		-- A tiny function for nvim-cmp to better sort completion items that start with one or more underlines
		"lukas-reineke/cmp-under-comparator",
		-- luasnip completion source for nvim-cmp
		"saadparwaiz1/cmp_luasnip",

		"L3MON4D3/LuaSnip", -- auto-completion cant work without this
	},
	config = function()
		local cmp = require("cmp")

		local function has_words_before()
			local cursor = vim.api.nvim_win_get_cursor(0)
			local line = cursor[1]
			local col = cursor[2]
			return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
		end

		cmp.setup({
			-- view = "custom",
			preselect = "none",
			completion = {
				completeopt = "menu,menuone,noinsert,noselect",
				-- completeopt = "menu,menuone"
			},
			-- experimental = { ghost_text = true },

			-- 指定 snippet 引擎
			snippet = {
				expand = function(args)
					-- -- For `vsnip` users.
					-- vim.fn["vsnip#anonymous"](args.body)
					-- For `luasnip` users.
					require("luasnip").lsp_expand(args.body)
					-- For `ultisnips` users.
					-- vim.fn["UltiSnips#Anon"](args.body)
					-- For `snippy` users.
					-- require"snippy".expand_snippet(args.body)
				end,
			},

			-- 来源
			sources = cmp.config.sources({
				{ name = "nvim_lsp", max_item_count = 10 },
				{ name = "buffer", max_item_count = 8, keyword_length = 2 },
				{ name = "rg", max_item_count = 5, keyword_length = 4 },
				{ name = "luasnip", max_item_count = 8 },
				{ name = "path" },
				{ name = "calc", max_item_count = 3 },
			}),

			-- 对补全建议排序
			sorting = {
				comparators = {
					cmp.config.compare.offset,
					cmp.config.compare.exact,
					cmp.config.compare.score,
					cmp.config.compare.recently_used,
					require("cmp-under-comparator").under,
					cmp.config.compare.kind,
					cmp.config.compare.sort_text,
					cmp.config.compare.length,
					cmp.config.compare.order,
				},
			},

			-- 快捷键
			mapping = {
				-- 上一个
				["<Up>"] = cmp.mapping.select_prev_item(),
				-- 下一个
				["<Down>"] = cmp.mapping.select_next_item(),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif require("luasnip").expand_or_jumpable() then
						require("luasnip").expand_or_jump()
					elseif has_words_before() then
						cmp.complete()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif require("luasnip").jumpable(-1) then
						require("luasnip").jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
				-- 出现补全
				["<C-j>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
				-- 取消
				["<C-k>"] = cmp.mapping({
					i = cmp.mapping.abort(),
					c = cmp.mapping.close(),
				}),
				["<CR>"] = cmp.mapping.confirm({
					select = false,
					behavior = cmp.ConfirmBehavior.Insert,
				}),
				["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
				["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
			},

			-- 使用 lspkind-nvim 显示类型图标
			formatting = {
				format = require("lspkind").cmp_format({
					mode = "symbol",
					maxwidth = 50,
					before = function(entry, vim_item)
						vim_item.menu = "[" .. string.upper(entry.source.name) .. "]"

						if entry.source.name == "calc" then
							vim_item.kind = "Calc"
						end

						if entry.source.name == "git" then
							vim_item.kind = "Git"
						end

						if entry.source.name == "rg" then
							vim_item.kind = "Search"
						end

						if entry.source.name == "rime" then
							vim_item.kind = "Rime"
						end

						if entry.source.name == "cmp_yanky" then
							vim_item.kind = "Clipboard"
						end

						return vim_item
					end,
					ellipsis_char = "...",
					symbol_map = {
						Text = "󰉿",
						Method = "󰆧",
						Function = "󰊕",
						Constructor = "",
						Field = "󰜢",
						Variable = "󰀫",
						Class = "󰠱",
						Interface = "",
						Module = "",
						Property = "󰜢",
						Unit = "󰑭",
						Value = "󰎠",
						Enum = "",
						Keyword = "󰌋",
						Snippet = "",
						Color = "󰏘",
						File = "󰈙",
						Reference = "󰈇",
						Folder = "󰉋",
						EnumMember = "",
						Constant = "󰏿",
						Struct = "󰙅",
						Event = "",
						Operator = "󰆕",
						TypeParameter = "",
						Calc = "",
						Git = "",
						Search = "",
						Rime = "",
						Clipboard = "",
						Call = "",
					},
				}),
			},
		})
	end,
}
