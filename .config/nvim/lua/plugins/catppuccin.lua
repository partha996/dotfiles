return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
			integrations = {
				navic = {
					enabled = false,
					custom_bg = "NONE",
				},
				snacks = {
					enabled = true,
					indent_scope_color = "lavender",
				},
				noice = true,
				ufo = true,
				beacon = true,
				flash = true,
				cmp = true,
				mason = true,
				rainbow_delimiters = true,
				render_markdown = true,
				treesitter = true,
				treesitter_context = true,
				native_lsp = {
					enabled = true,
					virtual_text = {
						errors = { "italic" },
						hints = { "italic" },
						warnings = { "italic" },
						information = { "italic" },
						ok = { "italic" },
					},
					underlines = {
						errors = { "underline" },
						hints = { "underline" },
						warnings = { "underline" },
						information = { "underline" },
						ok = { "underline" },
					},
					inlay_hints = {
						background = true,
					},
				},
			},
		})

		vim.cmd.colorscheme("catppuccin")
	end,
}
