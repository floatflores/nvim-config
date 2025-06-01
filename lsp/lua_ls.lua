return {
	cmd = { "lua-language-server" },
	settings = {
		Lua = {
			completion = {
				callSnippet = "Replace",
			},
		},
	},
	filetypes = { "lua" },
	root_markers = {
		".luarc.json",
		".luarc.jsonc",
		".luacheckrc",
		".stylua.toml",
		"stylua.toml",
		"selene.toml",
		"selene.yml",
		".git",
	},
}
