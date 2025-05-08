return {
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				-- lsp
				"lua-language-server",
				"clangd",
				"texlab",
				"basedpyright",
				"bash-language-server",
				-- linter
				"ruff",
				"cmakelint",
				"luacheck",
				"shellcheck",
				-- formater
				"clang-format",
				"stylua",
				"yapf",
				"cmakelang",
				"prettierd",
				"shfmt",
			},
			ui = {
				border = "single",
				width = 0.7,
				height = 0.7,
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		},
		config = function(_, opts)
			require("mason").setup(opts)
			local mr = require("mason-registry")
			local function ensure_installed()
				for _, tool in ipairs(opts.ensure_installed) do
					local p = mr.get_package(tool)
					if not p:is_installed() then
						p:install()
					end
				end
			end
			if mr.refresh then
				mr.refresh(ensure_installed)
			else
				ensure_installed()
			end
		end,
	},
	{
		"neovim/nvim-lspconfig",
		ft = { "lua", "python", "c", "cpp", "md", "json" },
		dependencies = {
			{ "williamboman/mason-lspconfig.nvim", config = true },
		},
		config = function()
			vim.diagnostic.config({
				virtual_text = {
					spacing = 4,
					prefix = "",
				},
				float = {
					severity_sort = true,
					source = "if_many",
					border = "single",
				},
				severity_sort = true,
			})

			local servers = {
				lua_ls = {
					settings = {
						Lua = {
							completion = {
								-- callSnippet = "Replace",
								showParams = true,
							},
						},
					},
				},
				clangd = {
					capabilities = { offsetEncoding = "utf-8" },
					cmd = { "clangd", "--compile-commands-dir=build" },
				},
				basedpyright = {
					settings = {
						basedpyright = {
							analysis = {
								autoImportCompletions = true,
							},
						},
					},
				},
				ruff = {},
				marksman = {},
				texlab = {
					settings = {
						texlab = {
							diagnostics = {
								ignoredPatterns = {
									"Overfull",
									"Underfull",
									"Package hyperref Warning",
									"Float too large for page",
									"contains only floats",
								},
							},
						},
					},
				},
			}
			local custom_handlers = {
				["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" }),
				["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "single" }),
			}
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("blink.cmp").get_lsp_capabilities())
			local function setup_server(server_name, config)
				config.capabilities = vim.tbl_deep_extend("force", {}, capabilities, config.capabilities or {})
				config.handlers = vim.tbl_deep_extend("force", {}, custom_handlers, config.handlers or {})
				require("lspconfig")[server_name].setup(config)
			end

			for server_name, server_opt in pairs(servers) do
				setup_server(server_name, server_opt)
			end
		end,
	},
}
