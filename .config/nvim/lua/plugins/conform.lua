return {
	'stevearc/conform.nvim',
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "ruff" },
				javascript = { "prettier" },
				java = { "google-java-format" },
				bash = { "shfmt" },
				yaml = { "yamlfix" },
				c = { "clang_format" }
			},
		})
	end
}
