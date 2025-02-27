return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.clang_format,
				null_ls.builtins.formatting.google_java_format,
				null_ls.builtins.formatting.shfmt,
				null_ls.builtins.formatting.black,
			},
		})
	end,
}
