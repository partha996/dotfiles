return {
	{
		"nvim-tree/nvim-tree.lua",
		event = "BufEnter",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			reload_on_bufenter = true,
			hijack_cursor = true,
			hijack_netrw = true,
			sync_root_with_cwd = true,
			hijack_unnamed_buffer_when_opening = true,
			auto_reload_on_write = true,
			diagnostics = {
				enable = true,
			},
			hijack_directories = {
				enable = true,
				auto_open = true,
			},
			actions = {
				open_file = {
					quit_on_open = true,
					resize_window = true,
				},
			},
			update_focused_file = {
				enable = true,
			},
			view = {
				centralize_selection = true,
				adaptive_size = false,
				side = "left",
				preserve_window_proportions = true,
				width = {
					max = -1,
				},
				float = {
					enable = true,
					quit_on_focus_loss = false,
					open_win_config = function()
						return {
							row = 1,
							col = 1,
							width = 30,
							height = 80,
							border = "rounded",
							relative = "editor",
						}
					end,
				},
			},
			renderer = {
				full_name = false,
				indent_markers = {
					enable = true,
				},
				root_folder_label = ":t",
				icons = {
					glyphs = {
						git = {
							unmerged = "",
							renamed = "󰑕",
							deleted = "󰛌",
							ignored = "",
							unstaged = "✗",
							staged = "✓",
							untracked = "󱍋",
						},
					},
				},
			},
		},
	},
}
