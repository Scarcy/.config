local function setupDAP()
	local dap = require("dap")

	dap.adapters.codelldb = {
		type = "server",
		port = "${port}",
		executable = {
			command = "/home/ellefsen/Downloads/extension/adapter/codelldb",
			args = { "--port", "${port}" },
		},
	}
	dap.adapters.coreclr = {
		type = "executable",
		command = "/usr/bin/netcoredbg",
		args = { "--interpreter=vscode" },
	}
	dap.configurations.c = {
		{
			name = "Launch file",
			type = "codelldb",
			request = "launch",
			-- For having prompt to ask for Executable file
			-- program = function()
			-- 	return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
			-- end,
			program = "${fileBasenameNoExtension}",
			cwd = vim.fn.getcwd(),
			stopOnEntry = false,
		},
	}
	dap.configurations.cs = {
		{
			type = "coreclr",
			name = "launch - netcoredbg",
			request = "launch",
			program = function()
				return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/bin/Debug", "file")
			end,
		},
	}
	dap.configurations.cpp = dap.configurations.c
	dap.configurations.rust = dap.configurations.c
	require("dapui").setup()
	require("nvim-dap-virtual-text").setup()

	-- Dap UI
	local dapui = require("dapui")

	dap.listeners.after.event_initialized["dapui_config"] = function()
		dapui.open()
	end
	dap.listeners.before.event_terminated["dapui_config"] = function()
		dapui.close()
	end
	dap.listeners.before.event_exited["dapui_config"] = function()
		dapui.close()
	end
end

local status, err = pcall(setupDAP)

if not status then
	print("Error setting up DAP: " .. err)
end
