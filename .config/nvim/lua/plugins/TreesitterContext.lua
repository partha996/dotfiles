return {
	"nvim-treesitter/nvim-treesitter-context",
	config = function()
		require("treesitter-context").setup({
			enable = true,
			max_lines = 0,
			min_window_height = 0,
			line_numbers = true,
			multiline_threshold = 20,
			trim_scope = "outer",
			mode = "cursor",
			separator = nil,
			zindex = 20,
			on_attach = nil,
			patterns = {
				lua = {
					"function",
					"for",
					"while",
					"if",
					"else",
					"repeat",
					"until",
					"local",
				},
				c = {
					"function",
					"struct",
					"if",
					"else",
					"for",
					"while",
					"switch",
					"case",
				},
				cpp = {
					"function",
					"class",
					"struct",
					"if",
					"else",
					"for",
					"while",
					"switch",
					"case",
				},
				java = {
					"class",
					"interface",
					"method",
					"if",
					"else",
					"for",
					"while",
					"switch",
					"case",
				},
				bash = {
					"if",
					"for",
					"while",
					"case",
					"function",
				},
			},
		})
	end,
}
