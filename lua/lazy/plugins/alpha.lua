-- ~/.config/nvim/lua/plugins/alpha.lua
return {
	{
		"goolord/alpha-nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.dashboard")

			dashboard.section.header.val = {
				[[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⣟⡿⣟⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
				[[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣻⣿⣿⣿⣿⣿⣿⣿⢿⣿⡾⡶⣤⣬⣟⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
				[[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣺⣾⣻⣟⣿⣹⣿⣿⣿⡟⠭⣺⣿⡿⣾⡮⣆⢱⢆⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
				[[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢟⣭⣾⣿⣿⣿⣿⣿⣿⣿⣿⣯⣶⣿⣿⣛⣰⣿⣿⡼⣯⣢⢳⡻⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
				[[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⣲⣿⣿⣿⢟⣿⣽⣿⣿⡿⣿⣿⣿⣿⡿⣿⣷⣿⣿⣿⣷⣽⠧⣧⢿⡽⣿⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿]],
				[[⣿⣿⣿⣿⣿⣿⣿⣿⣿⢏⣰⣿⣻⣿⢟⢿⣿⣿⣿⣿⣿⣿⣻⣻⡿⢻⣿⣿⣿⣿⣿⣿⣯⡿⣧⠞⣿⢻⣻⣿⣿⣿⣿⡸⣿⣿⣿⣿⣿]],
				[[⣿⣿⣿⣿⣿⣿⣿⣿⡟⣺⣿⣿⣿⡟⡏⣿⣿⣿⣿⣿⡇⣏⡏⢟⣴⣸⡿⢹⣿⢻⣿⢻⡿⢳⣹⣸⢹⣧⣗⡿⢿⣿⢿⣿⣿⣿⣿⣿⣿]],
				[[⣿⣿⣿⣿⣿⣿⢏⣿⢱⣿⣿⣿⣿⢣⢧⣿⣿⣿⣿⣿⣿⢺⣸⣷⣧⣿⣣⣿⢏⣿⢫⡿⢣⣮⡅⡇⢀⣿⠰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
				[[⣿⣿⣿⣿⣿⡇⣼⡟⣿⣿⣿⣿⢷⣿⣿⣿⣿⣿⣿⣿⣷⢸⠛⠉⠈⣑⠪⢍⣾⣧⣿⣮⠺⠏⠃⠫⢹⣿⣏⠅⣿⣿⣿⣿⣿⡿⢿⣿⣿]],
				[[⣿⣿⣿⣿⣿⢸⣷⣷⣿⣿⣿⠇⣹⣽⣿⣿⣿⣯⣻⣿⡗⢸⢀⡢⡴⢸⣷⣾⣿⣿⣿⡅⣀⣄⠢⡤⡺⣼⣾⡴⣿⣿⣿⣿⣿⢸⣧⣽⣯]],
				[[⣿⣿⣿⣿⣿⢸⢈⠇⡿⣿⠅⢻⣟⣸⡼⣿⣿⣿⣿⣿⣧⣧⣎⣿⣿⣿⣿⣿⣿⣿⣧⣿⢷⣾⣾⡑⡇⣿⢹⡗⣿⣿⣿⣿⣿⣧⣛⣭⣾]],
				[[⣿⣿⣿⣿⣿⡇⢨⠯⣵⢟⢳⢿⣾⣹⡧⡹⣿⣿⣿⣿⣟⡿⣮⠽⣿⣿⣿⣿⣿⣿⣿⣿⣾⣷⠉⣾⡷⣿⣼⡇⢿⣿⣿⣿⣿⣿⣿⣿⣿]],
				[[⣿⣿⣿⣿⣿⢏⡏⣴⡟⣾⣿⢸⣿⡟⡇⢾⣝⢿⣿⣿⣿⣿⣿⡷⢾⣻⣹⡿⣤⢒⣿⣼⣿⢏⣶⡿⢷⣵⡿⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
				[[⣿⣿⣿⣿⠟⣎⡖⡟⢱⡽⢻⢸⣆⢳⢻⠮⢿⣿⣾⣿⣟⣯⣽⣯⣭⣾⡿⣗⢫⣾⣿⡿⣻⠬⢿⣿⣿⣿⡷⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
				[[⣿⡿⣟⣵⣧⢹⡟⡌⢸⠇⡘⡟⣬⣸⣷⡢⣿⣽⡻⢿⣿⣿⣿⣿⠿⠿⠾⠥⠟⢛⣫⡜⡛⠾⣧⣿⡿⣿⡟⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
				[[⣿⣿⣿⣿⡏⣿⣷⣝⠘⡄⢑⠘⢞⢿⣻⣿⡾⣿⣯⣿⣟⠿⣿⣿⣧⣄⣀⠸⡴⠘⣼⣽⣽⣧⡹⢭⣞⣹⢷⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
				[[⣿⣿⣿⣿⡇⢿⡿⠫⣷⣹⣳⣶⣅⣓⢹⠟⠂⠑⢇⡈⠻⠿⣿⣟⠛⠸⢿⣟⣿⣟⢫⢞⣝⠿⠷⠆⣴⡋⢾⣽⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
				[[⣿⣿⣿⣿⣗⡼⣿⣿⡿⣪⢯⣏⣻⢃⣿⣧⠀⠀⣠⡁⠒⣶⣷⣉⣶⣿⣿⣿⣿⣿⣷⣷⡽⣏⠿⣵⣻⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
				[[⣿⣿⣿⣿⣿⣷⢝⡿⣿⢿⣻⡏⢰⣾⣿⠂⠴⠂⠉⠰⣿⣿⣯⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⢿⣿⢛⣵⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
				[[⣿⣿⣿⣿⣿⣿⣿⣶⣿⡿⢫⢺⣷⣿⢿⠀⡀⠀⡇⣴⣹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠸⠷⢽⢯⣣⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
				[[⣿⣿⣿⣿⣿⣿⣿⣿⡿⢸⣽⢋⣾⡿⡎⡆⠃⣄⠱⢸⣇⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡄⠜⡿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
			}

			dashboard.section.buttons.val = {}
			dashboard.section.footer.val = "好久不见，想我了吗～"

			alpha.setup(dashboard.config)

			vim.api.nvim_create_autocmd("ColorScheme", {
				callback = function()
					vim.cmd([[
            hi AlphaHeader   guifg=#FF69B4 ctermfg=204
            hi AlphaButton  guifg=#87CEEB ctermfg=117
            hi AlphaFooter  guifg=#98FB98 ctermfg=120
            hi AlphaButtons guibg=NONE    ctermbg=NONE
          ]])
				end,
			})
		end,
	},
}
