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
					-- "harper_ls",
				},
			})
		end,
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local navic = require("nvim-navic")
			local function on_attach(client, bufnr)
				if client.server_capabilities.documentSymbolProvider then
					navic.attach(client, bufnr)
				end
			end
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({ capabilities = capabilities, on_attach = on_attach })
			lspconfig.clangd.setup({ capabilities = capabilities, on_attach = on_attach })
			lspconfig.jdtls.setup({ capabilities = capabilities, on_attach = on_attach })
			lspconfig.bashls.setup({ capabilities = capabilities, on_attach = on_attach })
			lspconfig.cssls.setup({ capabilities = capabilities, on_attach = on_attach })
			lspconfig.html.setup({ capabilities = capabilities, on_attach = on_attach })
			lspconfig.jsonls.setup({ capabilities = capabilities, on_attach = on_attach })
			lspconfig.pylsp.setup({ capabilities = capabilities, on_attach = on_attach })
			lspconfig.taplo.setup({ capabilities = capabilities, on_attach = on_attach })
			lspconfig.yamlls.setup({ capabilities = capabilities, on_attach = on_attach })
			lspconfig.markdown_oxide.setup({ capabilities = capabilities, on_attach = on_attach })
			-- lspconfig.harper_ls.setup({ capabilities = capabilities, on_attach = on_attach })
		end,
	},
}
