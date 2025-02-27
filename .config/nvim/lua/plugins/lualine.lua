return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				theme = "catppuccin",
				-- component_separators = { left = '•', right = '•' }, --  ·•
				-- section_separators = { left = '', right = '' }, --  
				globalstatus = false,
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = {
					{ "filename", path = 1 },
					{
						"lsp_progress",
						-- Shows LSP progress like current task or function name
						display_components = { "lsp_client_name", "title", "percentage" },
						separator = " | ",
						always_visible = true,
					},
				},
				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
		})
	end,
}
