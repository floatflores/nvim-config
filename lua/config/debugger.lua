local dap = require("dap")

local debuggers = {
	"codelldb",
    "debugpy"
}
local mr = require("mason-registry")
for _, tool in ipairs(debuggers) do
	local success, package = pcall(mr.get_package, tool)
	if success and not package:is_installed() then
		vim.cmd("MasonInstall " .. package.name)
	end
end

-- Adapters
dap.adapters.gdb = {
	type = "executable",
	command = "gdb",
	args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
}

dap.adapters.codelldb = {
	type = "executable",
	command = "codelldb",
}

-- dap.adapters.python = function(cb, config)
-- 	if config.request == "attach" then
-- 		---@diagnostic disable-next-line: undefined-field
-- 		local port = (config.connect or config).port
-- 		---@diagnostic disable-next-line: undefined-field
-- 		local host = (config.connect or config).host or "127.0.0.1"
-- 		cb({
-- 			type = "server",
-- 			port = assert(port, "`connect.port` is required for a python `attach` configuration"),
-- 			host = host,
-- 			options = {
-- 				source_filetype = "python",
-- 			},
-- 		})
-- 	else
-- 		cb({
-- 			type = "executable",
-- 			command = function()
-- 				local cwd = vim.fn.getcwd()
-- 				if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
-- 					return cwd .. "/venv/bin/python"
-- 				elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
-- 					return cwd .. "/.venv/bin/python"
-- 				else
-- 					return "/usr/bin/python"
-- 				end
-- 			end,
-- 			args = { "-m", "debugpy.adapter" },
-- 			options = {
-- 				source_filetype = "python",
-- 			},
-- 		})
-- 	end
-- end
--
-- -- Configurations
-- dap.configurations.python = {
-- 	{
-- 		-- The first three options are required by nvim-dap
-- 		type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
-- 		request = "launch",
-- 		name = "Launch file",
--
-- 		-- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options
--
-- 		program = "${file}", -- This configuration will launch the current file if used.
-- 		pythonPath = function()
-- 			-- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
-- 			-- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
-- 			-- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
-- 			local cwd = vim.fn.getcwd()
-- 			if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
-- 				return cwd .. "/venv/bin/python"
-- 			elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
-- 				return cwd .. "/.venv/bin/python"
-- 			else
-- 				return "/usr/bin/python"
-- 			end
-- 		end,
-- 	},
-- }
dap.configurations.c = {
	{
		name = "Launch (codelldb)",
		type = "codelldb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
	},
	{
		name = "Launch (gdb)",
		type = "gdb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopAtBeginningOfMainSubprogram = false,
	},
	{
		name = "Select and attach to process (gdb)",
		type = "gdb",
		request = "attach",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		pid = function()
			local name = vim.fn.input("Executable name (filter): ")
			return require("dap.utils").pick_process({ filter = name })
		end,
		cwd = "${workspaceFolder}",
	},
	{
		name = "Attach to gdbserver :1234",
		type = "gdb",
		request = "attach",
		target = "localhost:1234",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
	},
}
dap.configurations.cpp = dap.configurations.c
dap.configurations.rust = dap.configurations.c
