return {
	"hasansujon786/nvim-navbuddy",
	dependencies = {
		"neovim/nvim-lspconfig",
		"SmiteshP/nvim-navic",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		local navbuddy = require("nvim-navbuddy")
		local actions = require("nvim-navbuddy.actions")

		navbuddy.setup({
			window = {
				border = "rounded",
				size = { height = "40%", width = "50%" },
				position = { row = "100", col = "50%" },
				scrolloff = nil,
				sections = {
					left = {
						size = "30%",
						border = nil,
					},
					mid = {
						size = "40%",
						border = nil,
					},
					right = {

						border = nil,
						preview = "never",
					},
				},
			},
			node_markers = {
				enabled = true,
				icons = {
					leaf = "  ",
					leaf_selected = " → ",
					branch = " ",
				},
			},
			icons = {
				Array = "󰅨 ",
				Boolean = " ",
				Class = " ",
				Constant = "󰏿 ",
				Constructor = " ",
				Enum = "󰕘 ",
				EnumMember = " ",
				Event = " ",
				Field = " ",
				File = "󰈙 ",
				Function = "󰡱 ",
				Interface = " ",
				Key = "󰌋 ",
				Method = "󰆧 ",
				Module = " ",
				Namespace = "󰌗 ",
				Null = "󰟢 ",
				Number = "󰎠 ",
				Object = " ",
				Operator = "󰆕 ",
				Package = " ",
				Property = " ",
				String = "󰅳 ",
				Struct = " ",
				TypeParameter = "󰊄 ",
				Variable = "  ",
			},
			use_default_mappings = true,
			mappings = {
				["<esc>"] = actions.close(),
				["q"] = actions.close(),

				["j"] = actions.next_sibling(),
				["k"] = actions.previous_sibling(),

				["h"] = actions.parent(),
				["l"] = actions.children(),
				["0"] = actions.root(), -- Move to first panel

				["v"] = actions.visual_name(), -- Visual selection of name
				["V"] = actions.visual_scope(), -- Visual selection of scope

				["y"] = actions.yank_name(), -- Yank the name to system clipboard "+
				["Y"] = actions.yank_scope(), -- Yank the scope to system clipboard "+

				["i"] = actions.insert_name(), -- Insert at start of name
				["I"] = actions.insert_scope(), -- Insert at start of scope

				["a"] = actions.append_name(), -- Insert at end of name
				["A"] = actions.append_scope(), -- Insert at end of scope

				["r"] = actions.rename(),

				["d"] = actions.delete(), -- Delete scope

				["f"] = actions.fold_create(), -- Create fold of current scope
				["F"] = actions.fold_delete(), -- Delete fold of current scope

				["c"] = actions.comment(), -- Comment out current scope

				["<enter>"] = actions.select(),
				["o"] = actions.select(),

				["J"] = actions.move_down(), -- Move focused node down
				["K"] = actions.move_up(), -- Move focused node up

				["s"] = actions.toggle_preview(), -- Show preview of current node

				["<C-v>"] = actions.vsplit(), -- Open selected node in a vertical split
				["<C-s>"] = actions.hsplit(), -- Open selected node in a horizontal split

				["g?"] = actions.help(), -- Open mappings help window
			},
			lsp = {
				auto_attach = true,
				preference = nil,
			},
			source_buffer = {
				follow_node = true,
				highlight = true,
				reorient = "smart", -- "smart", "top", "mid" or "none"
				scrolloff = nil, -- scrolloff value when navbuddy is open
			},
			custom_hl_group = "visual", -- "Visual" or any other hl group to use instead of inverted colors
		})
	end,
}
