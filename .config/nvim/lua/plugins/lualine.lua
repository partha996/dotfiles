return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons", "arkav/lualine-lsp-progress" },
	config = function()
		local mode = {
			"mode",
			fmt = function(str)
				return " " .. str
			end,
		}
		local lsp_name = {
			function()
				local clients = vim.lsp.get_active_clients({ bufnr = vim.fn.bufnr() })
				local icon =
				    require("nvim-web-devicons").get_icon_by_filetype(vim.api.nvim_buf_get_option(0,
					    "filetype"))

				local names = {}
				for _, client in ipairs(clients) do
					if client.name ~= "null-ls" then -- Exclude null-ls
						table.insert(names, client.name)
					end
				end
				if #names > 0 then
					return string.format("  %s %s", table.concat(names, ", "), icon or "")
				else
					return "No LSP" -- If no LSP is active
				end
			end,
			color = function()
				local _, color = require("nvim-web-devicons").get_icon_cterm_color_by_filetype(
					vim.api.nvim_buf_get_option(0, "filetype")
				)
				return { fg = color }
			end,
			on_click = function()
				vim.api.nvim_command("LspInfo")
			end,
		}
		require("lualine").setup({
			options = {
				icons_enable = true,
				theme = "catppuccin",
				-- component_separators = { left = '•', right = '•' }, --  ·•
				section_separators = { left = "", right = "" }, --   
				globalstatus = false,
				always_show_tabline = true,
				winbar = { "alpha" },
			},
			sections = {
				lualine_a = { mode },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = {
					{ "filename", path = 1 },
				},
				lualine_x = {
					lsp_name,
					{
						function()
							return require("noice").api.statusline.mode.get()
						end,
						cond = function()
							return require("noice").api.statusline.mode.has()
						end,
					},
					"filetype",
				},
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
		})
	end,
}
