return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
		"jayp0521/mason-null-ls.nvim",
	},
	config = function()
		require("mason-null-ls").setup({
			ensure_installed = {
				"ruff",
				"prettier",
				"shfmt",
				"stylua",
				"prettier",
				"google_java_format",
				"clang_format",
				"yamlfix",
			},
		})
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				-- https://www.reddit.com/r/neovim/comments/v2ifpb/text_fields_on_lsp_auto_completion/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
				-- null_ls.builtins.completion.spell,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.clang_format,
				null_ls.builtins.formatting.google_java_format,
				null_ls.builtins.formatting.yamlfix,
				null_ls.builtins.formatting.shfmt.with({ args = { "-i", "4" } }),
				require("none-ls.formatting.ruff").with({ extra_args = { "--extend-select", "I" } }),
				require("none-ls.formatting.ruff_format"),
			},
		})
	end,
}
