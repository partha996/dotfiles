return {
	"kevinhwang91/nvim-ufo",
	dependencies = {
		"kevinhwang91/promise-async",
	},
	config = function()
		vim.o.foldcolumn = "0" -- '0' is not bad
		vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true

		-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
		vim.keymap.set("n", "zR", require("ufo").openAllFolds)
		vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

		-- Tell the server the capability of foldingRange,
		-- Neovim hasn't added foldingRange to default capabilities, users must add it manually
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities.textDocument.foldingRange = {
			dynamicRegistration = false,
			lineFoldingOnly = true,
		}

		-- If you are using nvim-lspconfig
		local lspconfig = require("lspconfig")
		-- Replace <your_lsp_server> with the actual LSP server you are using

		lspconfig.lua_ls.setup({ capabilities = capabilities })
		lspconfig.clangd.setup({ capabilities = capabilities })
		lspconfig.jdtls.setup({ capabilities = capabilities })
		lspconfig.bashls.setup({ capabilities = capabilities })
		lspconfig.cssls.setup({ capabilities = capabilities })
		lspconfig.html.setup({ capabilities = capabilities })
		lspconfig.jsonls.setup({ capabilities = capabilities })

		require("ufo").setup({
			provider_selector = function(bufnr, filetype, buftype)
				return { "treesitter", "indent" }
			end,
		})
	end,
}
