return {
	"nvim-treesitter/nvim-treesitter",
	event = "VeryLazy",
	build = ":TSUpdate",
	dependencies = {
		-- more colorfull
		"p00f/nvim-ts-rainbow",
		"nvim-treesitter/nvim-treesitter-textobjects",
		"nvim-treesitter/nvim-treesitter-context",
		-- Use treesitter to autoclose and autorename html tag
		"windwp/nvim-ts-autotag",
		-- matchup pair of key-word/key-operator
		"andymass/vim-matchup",
		-- hope between diffent struct, make more easy
		{
			"mfussenegger/nvim-treehopper",
		},
	},

	config = function()
		local tree_sitter_config = require("nvim-treesitter.configs")

		vim.keymap.set(
			{ "n", "v" },
			"<leader>ts",
			"<cmd>lua require('tsht').nodes()<cr>",
			{ desc = "Toggle treehopper" }
		)
		tree_sitter_config.setup({
			highlight = { enable = true },
			indent = { enable = true },
			rainbow = {
				enable = true,
				extended_mode = true,
				max_file_lines = nil,
			},
			autotag = { enable = true },
			matchup = { enable = true },
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "+",
					node_incremental = "+",
					node_decremental = "-",
				},
			},
			ensure_installed = { "c", "cpp", "cmake", "python", "lua", "json", "sql", "bash", "toml", "yaml", "java" },
			treehopper = { enable = true },
			context = { enable = true },
			-- textobjects = {
			-- 	select = {
			-- 		enable = true,
			-- 		lookahead = true,
			-- 		keymaps = {
			-- 			["af"] = "@function.outer",
			-- 			["if"] = "@function.inner",
			-- 			["ac"] = "@class.outer",
			-- 			["ic"] = "@class.inner",
			-- 			["as"] = { query = "@scope", query_group = "locals" },
			-- 			["az"] = { query = "@fold", query_group = "folds" },
			-- 			["ai"] = "@call.outer",
			-- 			["ii"] = "@call.inner",
			-- 			["ad"] = "@conditional.outer",
			-- 			["id"] = "@conditional.inner",
			-- 			["ae"] = "@loop.outer",
			-- 			["ie"] = "@loop.inner",
			-- 			["ap"] = "@parameter.outer",
			-- 			["ip"] = "@parameter.inner",
			-- 			["ab"] = "@block.outer",
			-- 			["ib"] = "@block.inner",
			-- 			["at"] = "@comment.outer",
			-- 			["it"] = "@comment.inner",
			-- 			["ar"] = "@return.outer",
			-- 			["ir"] = "@return.inner",
			-- 			["al"] = "@statement.outer",
			-- 			["il"] = "@statement.inner",
			-- 			["an"] = "@number.outer",
			-- 			["in"] = "@number.inner",
			-- 			["ah"] = "@assignment.outer",
			-- 			["ih"] = "@assignment.inner",
			-- 		},
			-- 		selection_modes = {
			-- 			["@parameter.outer"] = "v", -- charwise
			-- 			["@function.outer"] = "V", -- linewise
			-- 			["@statement.outer"] = "V", -- linewise
			-- 			["@assignment.outer"] = "V", -- linewise
			-- 			["@block.outer"] = "V", -- linewise
			-- 			["@loop.outer"] = "V", -- linewise
			-- 			["@conditional.outer"] = "V", -- linewise
			-- 			["@class.outer"] = "V", -- linewise
			-- 		},
			-- 	},
			-- 	swap = {
			-- 		enable = true,
			-- 		swap_next = {
			-- 			["ml"] = "@parameter.inner",
			-- 			["mj"] = "@statement.outer",
			-- 			["mip"] = "@parameter.inner",
			-- 			["mib"] = "@block.outer",
			-- 			["mil"] = "@statement.outer",
			-- 			["mif"] = "@function.outer",
			-- 			["mic"] = "@class.outer",
			-- 			["min"] = "@number.inner",
			-- 		},
			-- 		swap_previous = {
			-- 			["mh"] = "@parameter.inner",
			-- 			["mk"] = "@statement.outer",
			-- 			["map"] = "@parameter.inner",
			-- 			["mab"] = "@block.outer",
			-- 			["mal"] = "@statement.outer",
			-- 			["maf"] = "@function.outer",
			-- 			["mac"] = "@class.outer",
			-- 			["man"] = "@number.inner",
			-- 		},
			-- 	},
			-- 	move = {
			-- 		enable = true,
			-- 		set_jumps = true, -- whether to set jumps in the jumplist
			-- 		goto_next_start = {
			-- 			["]f"] = "@function.outer",
			-- 			["]c"] = "@class.outer",
			-- 			["]s"] = { query_group = "locals", query = "@scope" },
			-- 			["]z"] = { query = "@fold", query_group = "folds" },
			-- 			["]i"] = "@call.*",
			-- 			["]d"] = "@conditional.*",
			-- 			["]o"] = "@loop.*",
			-- 			["]p"] = "@parameter.inner",
			-- 			["]b"] = "@block.outer",
			-- 			["]t"] = "@comment.*",
			-- 			["]r"] = "@return.inner",
			-- 			["]l"] = "@statement.*",
			-- 			["]n"] = "@number.*",
			-- 			["]h"] = "@assignment.outer",
			-- 		},
			-- 		goto_next_end = {
			-- 			["]F"] = "@function.outer",
			-- 			["]C"] = "@class.outer",
			-- 			["]S"] = { query = "@scope", query_group = "locals" },
			-- 			["]Z"] = { query = "@fold", query_group = "folds" },
			-- 			["]I"] = "@call.*",
			-- 			["]D"] = "@conditional.*",
			-- 			["]E"] = "@loop.*",
			-- 			["]P"] = "@parameter.inner",
			-- 			["]B"] = "@block.outer",
			-- 			["]T"] = "@comment.*",
			-- 			["]R"] = "@return.inner",
			-- 			["]L"] = "@statement.*",
			-- 			["]N"] = "@number.*",
			-- 			["]H"] = "@assignment.outer",
			-- 		},
			-- 		goto_previous_start = {
			-- 			["[f"] = "@function.outer",
			-- 			["[c"] = "@class.outer",
			-- 			["[s"] = { query = "@scope", query_group = "locals" },
			-- 			["[z"] = { query = "@fold", query_group = "folds" },
			-- 			["[i"] = "@call.*",
			-- 			["[d"] = "@conditional.*",
			-- 			["[e"] = "@loop.*",
			-- 			["[p"] = "@parameter.inner",
			-- 			["[b"] = "@block.outer",
			-- 			["[t"] = "@comment.*",
			-- 			["[r"] = "@return.inner",
			-- 			["[l"] = "@statement.*",
			-- 			["[n"] = "@number.*",
			-- 			["[h"] = "@assignment.outer",
			-- 		},
			-- 		goto_previous_end = {
			-- 			["[F"] = "@function.outer",
			-- 			["[C"] = "@class.outer",
			-- 			["[S"] = { query = "@scope", query_group = "locals" },
			-- 			["[Z"] = { query = "@fold", query_group = "folds" },
			-- 			["[I"] = "@call.*",
			-- 			["[D"] = "@conditional.*",
			-- 			["[E"] = "@loop.*",
			-- 			["[P"] = "@parameter.*",
			-- 			["[B"] = "@block.outer",
			-- 			["[T"] = "@comment.*",
			-- 			["[R"] = "@return.inner",
			-- 			["[L"] = "@statement.*",
			-- 			["[N"] = "@number.*",
			-- 			["[H"] = "@assignment.outer",
			-- 		},
			-- 	},
			-- 	lsp_interop = {
			-- 		enable = true,
			-- 		border = "none",
			-- 		floating_preview_opts = {},
			-- 		peek_definition_code = {
			-- 			["gsf"] = "@function.outer",
			-- 			["gsc"] = "@class.outer",
			-- 		},
			-- 	},
			-- },
		})
	end,
}
