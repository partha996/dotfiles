return {
	"echasnovski/mini.nvim",
	version = false,

	config = function()
		require("mini.ai").setup({
			{
				custom_textobjects = nil,

				mappings = {
					-- Main textobject prefixes
					around = "a",
					inside = "i",

					-- Next/last variants
					around_next = "an",
					inside_next = "in",
					around_last = "al",
					inside_last = "il",

					-- Move cursor to corresponding edge of `a` textobject
					goto_left = "g[",
					goto_right = "g]",
				},

				-- Number of lines within which textobject is searched
				n_lines = 50,

				-- How to search for object (first inside current line, then inside
				-- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
				-- 'cover_or_nearest', 'next', 'previous', 'nearest'.
				search_method = "cover_or_next",

				-- Whether to disable showing non-error feedback
				-- This also affects (purely informational) helper messages shown after
				-- idle time if user input is required.
				silent = false,
			},
		})
		require("mini.animate").setup({
			cursor = {
				enable = false,
				timing = require("mini.animate").gen_timing.linear({ duration = 250, unit = "total" }),
				path = require("mini.animate").gen_path.line({ max_length = 1000 }),
			},

			scroll = {
				enable = false,
				timing = require("mini.animate").gen_timing.linear({ duration = 250, unit = "total" }),
				subscroll = require("mini.animate").gen_subscroll.equal({ max_output_steps = 60 }),
			},

			resize = {
				enable = true,
				timing = require("mini.animate").gen_timing.linear({ duration = 250, unit = "total" }),
				subresize = require("mini.animate").gen_subresize.equal(),
			},

			open = {
				enable = true,
				timing = require("mini.animate").gen_timing.linear({ duration = 250, unit = "total" }),
				winconfig = require("mini.animate").gen_winconfig.static({ n_steps = 25 }),
				winblend = require("mini.animate").gen_winblend.linear({ from = 80, to = 100 }),
			},

			close = {
				enable = true,
				timing = require("mini.animate").gen_timing.linear({ duration = 250, unit = "total" }),
				winconfig = require("mini.animate").gen_winconfig.static({ n_steps = 25 }),
				winblend = require("mini.animate").gen_winblend.linear({ from = 80, to = 100 }),
			},
		})

		require("mini.comment").setup({

			{
				options = {
					-- Function to compute custom 'commentstring' (optional)
					custom_commentstring = nil,

					-- Whether to ignore blank lines when commenting
					ignore_blank_line = false,

					-- Whether to recognize as comment only lines without indent
					start_of_line = false,

					-- Whether to force single space inner padding for comment parts
					pad_comment_parts = true,
				},

				-- Module mappings. Use `''` (empty string) to disable one.
				mappings = {
					-- Toggle comment (like `gcip` - comment inner paragraph) for both
					-- Normal and Visual modes
					comment = "gc",

					-- Toggle comment on current line
					comment_line = "gcc",

					-- Toggle comment on visual selection
					comment_visual = "gc",

					-- Define 'comment' textobject (like `dgc` - delete whole comment block)
					-- Works also in Visual mode if mapping differs from `comment_visual`
					textobject = "gc",
				},

				-- Hook functions to be executed at certain stage of commenting
				hooks = {
					-- Before successful commenting. Does nothing by default.
					pre = function() end,
					-- After successful commenting. Does nothing by default.
					post = function() end,
				},
			},
		})

		require("mini.cursorword").setup({
			{
				delay = 100,
			},
		})

		require("mini.pairs").setup({
			{
				modes = { insert = true, command = false, terminal = false },

				mappings = {
					["("] = { action = "open", pair = "()", neigh_pattern = "[^\\]." },
					["["] = { action = "open", pair = "[]", neigh_pattern = "[^\\]." },
					["{"] = { action = "open", pair = "{}", neigh_pattern = "[^\\]." },
					[")"] = { action = "close", pair = "()", neigh_pattern = "[^\\]." },
					["]"] = { action = "close", pair = "[]", neigh_pattern = "[^\\]." },
					["}"] = { action = "close", pair = "{}", neigh_pattern = "[^\\]." },
					['"'] = {
						action = "closeopen",
						pair = '""',
						neigh_pattern = "[^\\].",
						register = { cr = false },
					},
					["'"] = {
						action = "closeopen",
						pair = "''",
						neigh_pattern = "[^%a\\].",
						register = { cr = false }
					},
					["`"] = {
						action = "closeopen",
						pair = "``",
						neigh_pattern = "[^\\].",
						register = { cr = false }
					},
				},
			},
		})

		require("mini.surround").setup({
			{
				custom_surroundings = nil,

				highlight_duration = 500,

				mappings = {
					add = "sa", -- Add surrounding in Normal and Visual modes
					delete = "sd", -- Delete surrounding (sd b(brackets),q(quotes), etc)
					find = "sf", -- Find surrounding (to the right)
					replace = "sr", -- Replace surrounding
					find_left = "", -- Find surrounding (to the left)
					highlight = "", -- Highlight surrounding
					update_n_lines = "", -- Update `n_lines`

					suffix_last = "", -- Suffix to search with "prev" method
					suffix_next = "", -- Suffix to search with "next" method
				},

				-- Number of lines within which surrounding is searched
				n_lines = 20,

				respect_selection_type = false,

				-- How to search for surrounding (first inside current line, then inside
				-- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
				-- 'cover_or_nearest', 'next', 'prev', 'nearest'. For more details,
				-- see `:h MiniSurround.config`.
				search_method = "cover",

				-- Whether to disable showing non-error feedback
				-- This also affects (purely informational) helper messages shown after
				-- idle time if user input is required.
				silent = false,
			},
		})
		require("mini.bracketed").setup({
			buffer = { suffix = "", options = {} },
			comment = { suffix = "c", options = {} },
			conflict = { suffix = "x", options = {} },
			diagnostic = { suffix = "d", options = {} },
			indent = { suffix = "i", options = {} },
			file = { suffix = "", options = {} },
			jump = { suffix = "", options = {} },
			location = { suffix = "", options = {} },
			oldfile = { suffix = "", options = {} },
			quickfix = { suffix = "", options = {} },
			treesitter = { suffix = "", options = {} },
			undo = { suffix = "", options = {} },
			window = { suffix = "", options = {} },
			yank = { suffix = "", options = {} },
		})
		require("mini.move").setup({
			mappings = {
				-- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
				left = "<C-Left>",
				right = "<C-Right>",
				down = "<C-Down>",
				up = "<C-UP>",

				-- Move current line in Normal mode
				line_left = "<C-Left>",
				line_right = "<C-Right>",
				line_down = "<C-Down>",
				line_up = "<C-UP>",
			},
			options = {
				-- Automatically reindent selection during linewise vertical move
				reindent_linewise = true,
			},
		})
		require("mini.splitjoin").setup({
			mappings = {
				toggle = "gs",
				split = "",
				join = "",
			},
		})
		-- require("mini.trailspace").setup({
		-- 	only_in_normal_buffers = false,
		-- })
	end,
}
