return {
	"OXY2DEV/markview.nvim",
	lazy = false,
	config = function()
		require("markview").setup({
			-- For blink.cmp's completion source
			depends = {
				"saghen/blink.cmp",
			},
			preview = {
				filetypes = { "markdown" },
				ignore_buftypes = {},
			},
		})
	end,
}
