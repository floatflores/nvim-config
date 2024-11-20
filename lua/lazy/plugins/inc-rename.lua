return {
	"smjonas/inc-rename.nvim",
	ft = { "c", "cpp", "python", "java", "javascript", "lua" },
	keys = {
		{
			"rn",
			":IncRename ",
			desc = "Rename Parameter Under Cursor",
		},
	},
	main = "inc_rename",
	opts = {},
	config = true,
}
