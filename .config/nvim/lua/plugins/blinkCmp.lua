return {
	"saghen/blink.cmp",
	dependencies = { "rafamadriz/friendly-snippets" },
	event = { "BufEnter" },
	version = "1.*",
	config = function()
		require("blink.cmp").setup({
			keymap = {
				preset = "enter",
				["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
				["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
				["<C-space>"] = { "show", "hide" },
				["<C-y>"] = { "show_documentation", "hide_documentation" },
			},
			completion = {
				documentation = {
					auto_show = true,
					treesitter_highlighting = true,
					window = {
						border = "rounded",
					},
				},
				menu = {
					border = "rounded",
					draw = {
						treesitter = { "lsp" },
						cursorline_priority = 0,
						-- columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind", gap = 1 } },
						components = {
							kind_icon = {
								text = function(ctx)
									local kind_icon, _, _ = require("lspkind").symbolic(ctx.kind, { mode = "symbol" })
									return kind_icon
								end,

								highlight = function(ctx)
									local hl = ctx.kind_hl
									if vim.tbl_contains({ "Path" }, ctx.source_name) then
										local dev_icon, dev_hl =
											require("lspkind").symbolic(ctx.kind, { mode = "symbol" })
										if dev_icon then
											hl = dev_hl
										end
									end
									return hl
								end,
							},
							kind = {
								highlight = function(ctx)
									local hl = ctx.kind_hl
									if vim.tbl_contains({ "Path" }, ctx.source_name) then
										local dev_icon, dev_hl =
											require("lspkind").symbolic(ctx.kind, { mode = "symbol" })
										if dev_icon then
											hl = dev_hl
										end
									end
									return hl
								end,
							},
						},
					},
				},
				ghost_text = { enabled = true, show_with_menu = true },
			},
			signature = {
				enabled = true,
				window = { border = "rounded" },
			},
			appearance = {
				-- Sets the fallback highlight groups to nvim-cmp's highlight groups
				use_nvim_cmp_as_default = false,
				-- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
				nerd_font_variant = "normal",
				-- kind_icons = kind_icon,
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
			fuzzy = { implementation = "prefer_rust" },
		})
	end,
}
