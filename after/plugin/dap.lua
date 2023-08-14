local wk = require("which-key")
local dap = require("dap")
wk.register({
	name = "Dap",
	["b"] = {
		function()
			dap.toggle_breakpoint()
		end,
		"Toggle Breakpoint",
	},
	["B"] = {
		function()
			dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
		end,
		"Set Conditional Breakpoint",
	},
}, { prefix = "<leader>" })

wk.register({
	["<F2>"] = {
		function()
			require("dap").step_into()
		end,
		"Step Into",
	},
	["<F3>"] = {
		function()
			require("dap").step_over()
		end,
		"Step Over",
	},
	["<F4>"] = {
		function()
			require("dap").step_out()
		end,
		"Step Out",
	},
	["<F5>"] = {
		function()
			require("dap").continue()
		end,
		"DAP Continue",
	},
})
