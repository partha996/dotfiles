return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup({
			renderer = {
				indent_markers = { enable = true },
				group_empty = true,
			},
			filters = {
				dotfiles = true,
			},
		})
	end,
}
