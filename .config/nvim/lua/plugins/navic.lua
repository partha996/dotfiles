return {
	"SmiteshP/nvim-navic",
	dependencies = {
		"neovim/nvim-lspconfig",
	},
	config = function()
		require("nvim-navic").setup({

			highlight = true,
			separator = "  ",
			depth_limit = 0,
			depth_limit_indicator = "..",
			safe_output = false,
			lazy_update_context = false,
			click = true,
			icons = {
				File = "󰈙 ",
				Module = " ",
				Namespace = "󰌗 ",
				Package = " ",
				Class = " ",
				Method = "󰆧 ",
				Property = " ",
				Field = " ",
				Constructor = " ",
				Enum = "󰕘 ",
				Interface = " ",
				Function = "󰡱 ",
				Variable = "  ",
				Constant = "󰏿 ",
				String = "󰅳 ",
				Number = "󰎠 ",
				Boolean = " ",
				Array = "󰅨 ",
				Object = " ",
				Key = "󰌋 ",
				Null = "󰟢 ",
				EnumMember = " ",
				Struct = " ",
				Event = " ",
				Operator = "󰆕 ",
				TypeParameter = "󰊄 ",
			},

			lsp = {
				auto_attach = true,
				preference = nil,
			},
		})

		local colors = require("catppuccin.palettes").get_palette()

		vim.api.nvim_set_hl(0, "NavicIconsArray", { fg = colors.green, bg = "NONE" })
		vim.api.nvim_set_hl(0, "NavicIconsBoolean", { fg = colors.peach, bg = "NONE" })
		vim.api.nvim_set_hl(0, "NavicIconsClass", { fg = colors.yellow, bg = "NONE" })
		vim.api.nvim_set_hl(0, "NavicIconsConstant", { fg = colors.peach, bg = "NONE" })
		vim.api.nvim_set_hl(0, "NavicIconsConstructor", { fg = colors.sapphire, bg = "NONE" })
		vim.api.nvim_set_hl(0, "NavicIconsEnum", { fg = colors.teal, bg = "NONE" })
		vim.api.nvim_set_hl(0, "NavicIconsEnumMember", { fg = colors.red, bg = "NONE" })
		vim.api.nvim_set_hl(0, "NavicIconsEvent", { fg = colors.orange, bg = "NONE" })
		vim.api.nvim_set_hl(0, "NavicIconsField", { fg = colors.teal, bg = "NONE" })
		vim.api.nvim_set_hl(0, "NavicIconsFile", { fg = colors.blue, bg = "NONE" })
		vim.api.nvim_set_hl(0, "NavicIconsFunction", { fg = colors.blue, bg = "NONE" })
		vim.api.nvim_set_hl(0, "NavicIconsInterface", { fg = colors.pink, bg = "NONE" })
		vim.api.nvim_set_hl(0, "NavicIconsKey", { fg = colors.pink, bg = "NONE" })
		vim.api.nvim_set_hl(0, "NavicIconsKeyword", { fg = colors.mauve, bg = "NONE" })
		vim.api.nvim_set_hl(0, "NavicIconsMethod", { fg = colors.blue, bg = "NONE" })
		vim.api.nvim_set_hl(0, "NavicIconsModule", { fg = colors.mauve, bg = "NONE" })
		vim.api.nvim_set_hl(0, "NavicIconsNamespace", { fg = colors.sapphire, bg = "NONE" })
		vim.api.nvim_set_hl(0, "NavicIconsNumber", { fg = colors.peach, bg = "NONE" })
		vim.api.nvim_set_hl(0, "NavicIconsObject", { fg = colors.sky, bg = "NONE" })
		vim.api.nvim_set_hl(0, "NavicIconsOperator", { fg = colors.sky, bg = "NONE" })
		vim.api.nvim_set_hl(0, "NavicIconsPackage", { fg = colors.lavender, bg = "NONE" })
		vim.api.nvim_set_hl(0, "NavicIconsProperty", { fg = colors.green, bg = "NONE" })
		vim.api.nvim_set_hl(0, "NavicIconsString", { fg = colors.green, bg = "NONE" })
		vim.api.nvim_set_hl(0, "NavicIconsStruct", { fg = colors.yellow, bg = "NONE" })
		vim.api.nvim_set_hl(0, "NavicIconsVariable", { fg = colors.peach, bg = "NONE" })
		vim.api.nvim_set_hl(0, "NavicText", { fg = colors.lavender, bg = "NONE" })
		vim.api.nvim_set_hl(0, "NavicSeparator", { fg = colors.Mantle, bg = "NONE" })

		vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
	end,
}
