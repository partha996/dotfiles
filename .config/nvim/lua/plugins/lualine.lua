return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "SmiteshP/nvim-navic" },
	config = function()
		local mode = {
			"mode",
			fmt = function(str)
				return " " .. str
			end,
		}
		local icons = {
			"icons",
			fmt = function(str)
				return "🚀" .. str
			end,
		}
		local lsp_name = {
			"lsp_name",

			fmt = function()
				local lsps = vim.lsp.get_active_clients({ bufnr = vim.fn.bufnr() })
				local icon =
				    require("nvim-web-devicons").get_icon_by_filetype(vim.api.nvim_buf_get_option(0,
					    "filetype"))
				if lsps and #lsps > 0 then
					local names = {}
					for _, lsp in ipairs(lsps) do
						table.insert(names, lsp.name)
					end
					return string.format("%s %s", table.concat(names, ", "), icon)
				else
					return icon or ""
				end
			end,
			on_click = function()
				vim.api.nvim_command("LspInfo")
			end,
			color = function()
				local _, color = require("nvim-web-devicons").get_icon_cterm_color_by_filetype(
					vim.api.nvim_buf_get_option(0, "filetype")
				)
				return { fg = color }
			end,
		}
		require("lualine").setup({
			options = {
				icons_enable = true,
				theme = "catppuccin",
				-- component_separators = { left = '•', right = '•' }, --  ·•
				section_separators = { left = "", right = "" }, --  
				globalstatus = false,
				always_show_tabline = true,
				winbar = { "alpha" },
			},
			sections = {
				lualine_a = { mode },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = {
					{ "filename" },
					{
						"lsp_progress",
						-- Shows LSP progress like current task or function name
						display_components = { "lsp_client_name", "title", "percentage" },
						separator = " | ",
						always_visible = true,
					},
				},
				lualine_x = { icons, lsp_name, "fileformat", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
		})
	end,
}
