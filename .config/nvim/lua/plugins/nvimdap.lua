return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"theHamsta/nvim-dap-virtual-text",
		"jay-babu/mason-nvim-dap.nvim",
	},
	config = function()
		require("mason-nvim-dap").setup({
			ensure_installed = {
				"cpptools", -- C, C++, Rust
				"debugpy", -- Python
				"java-debug-adapter", -- Java
				"local-lua-debugger", -- Lua
			},
			automatic_setup = true,
			handlers = {
				function(config)
					require("mason-nvim-dap").default_setup(config) -- don't forget this!
				end,
			},
		})
		require("nvim-dap-virtual-text").setup()
		local dap, dapui = require("dap"), require("dapui")
		dapui.setup()

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end
	end,
}
