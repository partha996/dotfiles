return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
	--@module 'render-markdown'
	config = function()
		require("render-markdown").setup({
			enabled = false,
			preset = "round",
			ft = { "markdown", "quarto" },
		})
	end,
}
