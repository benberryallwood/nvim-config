-- local status_ok, dap = pcall(require, "dap")
-- if not status_ok then
-- 	return
-- end

local py_status_ok, dap_python = pcall(require, "dap-python")
if not py_status_ok then
	return
end

dap_python.setup('~/.virtualenvs/debugpy/bin/python')
dap_python.test_runner = 'pytest'

-- dap.adapters.python = {
-- 	type = "executable",
-- 	command = "/usr/local/lib/debugpy_venv/bin/python",
-- 	args = { "-m", "debugpy.adapter" },
-- }
--
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
