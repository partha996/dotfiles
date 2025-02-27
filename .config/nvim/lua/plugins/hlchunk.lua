return {
	"shellRaining/hlchunk.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("hlchunk").setup({
			chunk = { enable = true },
			indent = {
				enable = true,
				char = {
					"|",
				},
				style = {
					vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Whitespace")), "fg", "gui"),
				},
			},
			line_num = { enable = true },
			blank = {
				{ enable = true },
			},
		})
	end,
}
