return {
	"echasnovski/mini.pairs",
	event = "InsertEnter",
	opts = {
		modes = { insert = true, command = true, terminal = false },
		skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
		skip_ts = { "string" },
		skip_unbalanced = true,
		markdown = true,
	},
	main = "mini.pairs",
	config = true,
}
