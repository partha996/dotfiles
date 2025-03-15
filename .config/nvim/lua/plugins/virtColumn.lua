return {
	"lukas-reineke/virt-column.nvim",
	config = function()
		require("virt-column").setup({
			exclude = { filetypes = { "markdown", "txt", "pdf", "zsh", "tmux" } },
			update = true,
			char = "|",
			virtcolumn = "+1,120",
		})
	end,
}
