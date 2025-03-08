return {
	"3rd/image.nvim",
	opts = {
		backend = "kitty", -- Set to "kitty" since you use it
		integrations = {
			markdown = {
				enabled = true,
				clear_in_insert_mode = true,
				only_render_image_at_cursor = false,
				download_remote_images = true,
				filetypes = { "markdown", "txt" },
			},
		},
	},
}
