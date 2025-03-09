return {
	"hrsh7th/nvim-cmp",
	enabled = false,
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"f3fora/cmp-spell",
		"hrsh7th/cmp-calc",
		"hrsh7th/cmp-emoji",
		-- "hrsh7th/cmp-cmdline",
		"lukas-reineke/cmp-rg",
		"saadparwaiz1/cmp_luasnip",
		"onsails/lspkind-nvim",
		"lukas-reineke/cmp-under-comparator",
		-- "hrsh7th/cmp-nvim-lsp-signature-help",
	},
	config = function()
		local cmp = require("cmp")
		cmp.setup({
			view = {
				entries = "custom",
			},
			completion = {
				completeopt = "menu,menuone,noinsert,noselect",
				keyword_length = 2,
			},
			preselect = cmp.PreselectMode.Insert,
			-- confirmation = {
			-- 	default_behavior = cmp.ConfirmBehavior.Insert,
			-- },
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			-- NOTE: There is no scroll page if we set limitation to sources, this will just cut the results from lsp
			sources = cmp.config.sources({
				{ name = "luasnip" },
				{ name = "nvim_lsp" },
				{ name = "vim-dadbod-completion" },
				-- { name = "cmdline" },
				{ name = "lazydev" },
				{ name = "calc" },
				{ name = "emoji" },
				{ name = "spell" },
				{ name = "buffer" },
				{ name = "rg" },
				{ name = "path" },
			}),
			-- experimental = {
			-- 	ghost_text = true,
			-- },
			sorting = {
				priority_weight = 2,
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
			mapping = {
				["<Up>"] = cmp.mapping.select_prev_item(),
				["<Down>"] = cmp.mapping.select_next_item(),
				["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s", "c" }),
				["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s", "c" }),
				["<CR>"] = cmp.mapping.confirm({
					select = false,
					behavior = cmp.ConfirmBehavior.Insert,
				}),
				-- NOTE: almost never use
				["<C-o>"] = cmp.mapping(cmp.mapping.close_docs(), { "i" }),
				["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4)),
				["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4)),
			},

			formatting = {
				fields = { "abbr", "kind", "menu" },
				expandable_indicator = true,
				format = require("lspkind").cmp_format({
					-- mode = "symbol",
					maxwidth = {
						menu = 20,
						abbr = 30,
					},
					show_labelDetails = true,
					before = function(entry, vim_item)
						vim_item.menu = "<" .. string.upper(entry.source.name) .. ">"
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
					},
				}),
			},
		})
	end,
}
