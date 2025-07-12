return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
			transparent_background = true,
			term_colors = false,
			no_italic = false,
			no_bold = false,
			no_underline = false,
			styles = {
				comments = { "italic" },
				conditionals = { "italic" },
				loops = {},
				functions = {},
				keywords = {},
				strings = {},
				variables = {},
				numbers = {},
				booleans = { "bold" },
				properties = {},
				types = {},
				operators = {},
				-- miscs = {}, -- Uncomment to turn off hard-coded styles
			},
			integrations = {
				snacks = {
					enabled = true,
					indent_scope_color = "lavender",
				},
				mini = {
					enabled = true,
					indent_scope_color = true,
				},
				noice = true,
				ufo = true,
				beacon = true,
				flash = true,
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

		vim.cmd.colorscheme("catppuccin-mocha")
	end,
}
