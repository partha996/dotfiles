return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"clangd",
					"jdtls",
					"bashls",
					"cssls",
					"html",
					"jsonls",
					"pylsp",
					"taplo",
					"yamlls",
					"markdown_oxide",
					"ts_ls",
					-- "java-language-server",
				},
			})
		end,
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.clangd.setup({})
			lspconfig.jdtls.setup({})
			lspconfig.bashls.setup({})
			lspconfig.cssls.setup({})
			lspconfig.html.setup({})
			lspconfig.jsonls.setup({})
			lspconfig.pylsp.setup({})
			lspconfig.taplo.setup({})
			lspconfig.yamlls.setup({})
			lspconfig.markdown_oxide.setup({})
			lspconfig.ts_ls.setup({})
			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
						diagnostics = {
							globals = { "love" },
						},
						workspace = {
							library = {
								"${3rd}/love2d/library",
							},
						},
					},
				},
			})
		end,
	},
}
