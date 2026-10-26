return {
	cmd = { "bash-language-server", "start" },
	filetypes = { "bash", "sh" },
	root_markers = { ".git" },
	settings = {
		bashIde = {
			-- Prevent recursive scanning when opening a file directly in $HOME.
			globPattern = vim.env.GLOB_PATTERN or "*@(.sh|.inc|.bash|.command)",
		},
	},
}
