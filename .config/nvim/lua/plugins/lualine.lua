return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local mode = {
			"mode",
			fmt = function(str)
				return " " .. str
			end,
		}
		require("lualine").setup({
			extensions = { "quickfix", "trouble", "mason", "lazy" },
			options = {
				icons_enable = true,
				theme = "catppuccin",
				-- component_separators = { left = '', right = '' }, --  ·•
				section_separators = { left = "", right = "" }, --     
				globalstatus = false,
				always_show_tabline = true,
				winbar = { "alpha" },
			},
			sections = {
				lualine_a = { mode },
				lualine_b = { "branch", { "diff", symbols = { added = " ", modified = " ", removed = " " } } },
				lualine_c = {
					{
						"filename",
						symbols = {
							modified = "●",
							readonly = "󰌾",
							unnamed = "[No Name]",
							newfile = "[New]",
						},
						path = 1,
					},
				},
				lualine_x = {
					{ "diagnostics", symbols = { error = " ", warn = " ", info = " ", hint = "󰖷 " } },
					{
						require("noice").api.status.command.get,
						cond = require("noice").api.status.command.has,
						color = { fg = "#ff9e64" },
					},
				},
				lualine_y = {
					{
						"lsp_status",
						icon = " ", -- f013
						symbols = {
							-- Standard unicode symbols to cycle through for LSP progress:
							spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
							-- Standard unicode symbol for when LSP is done:
							done = "",
							-- Delimiter inserted between LSP names:
							separator = " ",
						},
						ignore_lsp = {},
					},

					"progress",
				},
				lualine_z = { "location" },
			},
		})
	end,
}
