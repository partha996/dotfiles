return {
	"echasnovski/mini.nvim",
	version = false,

	config = function()
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

		-- xoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxoxxoxoxoxoxooxxoxooxoxoxx

		require("mini.comment").setup({

			-- No need to copy this inside `setup()`. Will be used automatically.
			{
				-- Options which control module behavior
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

		-- xoxoxoxoxoxoxoxoxooxoxoxoxoxxoxoxoxoxoxoxoxxoxooxoxoxox

		require("mini.cursorword").setup({
			{
				delay = 100,
			},
		})

		--xoxoxoxoxoxoxoxoxoxoxoxooxoxx

		require("mini.files").setup({
			{
				-- Customization of shown content
				content = {
					-- Predicate for which file system entries to show
					filter = nil,
					-- What prefix to show to the left of file system entry
					prefix = nil,
					-- In which order to show file system entries
					sort = nil,
				},

				-- Module mappings created only inside explorer.
				-- Use `''` (empty string) to not create one.
				mappings = {
					close = "q",
					go_in = "l",
					go_in_plus = "L",
					go_out = "h",
					go_out_plus = "H",
					mark_goto = "'",
					mark_set = "m",
					reset = "<BS>",
					reveal_cwd = "@",
					show_help = "g?",
					synchronize = "=",
					trim_left = "<",
					trim_right = ">",
				},

				-- General options
				options = {
					-- Whether to delete permanently or move into module-specific trash
					permanent_delete = true,
					-- Whether to use for editing directories
					use_as_default_explorer = true,
				},

				-- Customization of explorer windows
				windows = {
					-- Maximum number of windows to show side by side
					max_number = math.huge,
					-- Whether to show preview of file/directory under cursor
					preview = true,
					-- Width of focused window
					width_focus = 50,
					-- Width of non-focused window
					width_nofocus = 15,
					-- Width of preview window
					width_preview = 25,
				},
			},
		})

		-- xoxoxoxoxoxoxoxoxoxoxo

		-- require("mini.move").setup({
		-- 	{
		-- 		-- Module mappings. Use `''` (empty string) to disable one.
		-- 		mappings = {
		-- 			-- Move visual selection in Visual mode.Defaults are Alt (Meta) + hjkl.
		-- 			left = '<Leader>h',
		-- 			right = '<Leader>l',
		-- 			down = '<leader>j',
		-- 			up = '<leader>k',
		--
		-- 			-- Move current line in Normal mode
		-- 			line_left = '',
		-- 			line_right = '',
		-- 			line_down = '',
		-- 			line_up = '',
		-- 		},
		--
		-- 		-- Options which control moving behavior
		-- 		options = {
		-- 			-- Automatically reindent selection during linewise vertical move
		-- 			reindent_linewise = true,
		-- 		},
		-- 	}
		-- })

		--xoxoxoxoxoxoxoxoxooxxoxoxo

		-- require("mini.notify").setup({
		-- 	-- Content management
		-- 	content = {
		-- 		-- Function which formats the notification message
		-- 		-- By default prepends message with notification time
		-- 		format = nil,
		--
		-- 		-- Function which orders notification array from most to least important
		-- 		-- By default orders first by level and then by update timestamp
		-- 		sort = nil,
		-- 	},
		--
		-- 	-- Notifications about LSP progress
		-- 	lsp_progress = {
		-- 		-- Whether to enable showing
		-- 		enable = true,
		--
		-- 		-- Duration (in ms) of how long last message should be shown
		-- 		duration_last = 1000,
		-- 	},
		--
		-- 	-- Window options
		-- 	window = {
		-- 		-- Floating window config
		-- 		config = {},
		--
		-- 		-- Maximum window width as share (between 0 and 1) of available columns
		-- 		max_width_share = 0.382,
		--
		-- 		-- Value of 'winblend' option
		-- 		winblend = 25,
		-- 	},
		-- })

		--xoxoxoxoxoxoxooxoxoxoxoxox

		require("mini.pairs").setup({
			-- No need to copy this inside `setup()`. Will be used automatically.
			{
				-- In which modes mappings from this `config` should be created
				modes = { insert = true, command = false, terminal = false },

				-- Global mappings. Each right hand side should be a pair information, a
				-- table with at least these fields (see more in |MiniPairs.map|):
				-- - <action> - one of 'open', 'close', 'closeopen'.
				-- - <pair> - two character string for pair to be used.
				-- By default pair is not inserted after `\`, quotes are not recognized by
				-- `<CR>`, `'` does not insert pair after a letter.
				-- Only parts of tables can be tweaked (others will use these defaults).
				mappings = {
					["("] = { action = "open", pair = "()", neigh_pattern = "[^\\]." },
					["["] = { action = "open", pair = "[]", neigh_pattern = "[^\\]." },
					["{"] = { action = "open", pair = "{}", neigh_pattern = "[^\\]." },

					[")"] = { action = "close", pair = "()", neigh_pattern = "[^\\]." },
					["]"] = { action = "close", pair = "[]", neigh_pattern = "[^\\]." },
					["}"] = { action = "close", pair = "{}", neigh_pattern = "[^\\]." },

					['"'] = { action = "closeopen", pair = '""', neigh_pattern = "[^\\].", register = { cr = false } },
					["'"] = { action = "closeopen", pair = "''", neigh_pattern = "[^%a\\].", register = { cr = false } },
					["`"] = { action = "closeopen", pair = "``", neigh_pattern = "[^\\].", register = { cr = false } },
				},
			},
		})
		--xoxoxoxoxoxoxoxxoooooxoxoxox

		require("mini.surround").setup({
			-- No need to copy this inside `setup()`. Will be used automatically.
			{
				-- Add custom surroundings to be used on top of builtin ones. For more
				-- information with examples, see `:h MiniSurround.config`.
				custom_surroundings = nil,

				-- Duration (in ms) of highlight when calling `MiniSurround.highlight()`
				highlight_duration = 500,

				-- Module mappings. Use `''` (empty string) to disable one.
				mappings = {
					add = "sa", -- Add surrounding in Normal and Visual modes
					delete = "sd", -- Delete surrounding (sd b(brackets),q(quotes), etc)
					find = "sf", -- Find surrounding (to the right)
					find_left = "sF", -- Find surrounding (to the left)
					highlight = "sh", -- Highlight surrounding
					replace = "sr", -- Replace surrounding
					update_n_lines = "sn", -- Update `n_lines`

					suffix_last = "l", -- Suffix to search with "prev" method
					suffix_next = "n", -- Suffix to search with "next" method
				},

				-- Number of lines within which surrounding is searched
				n_lines = 20,

				-- Whether to respect selection type:
				-- - Place surroundings on separate lines in linewise mode.
				-- - Place surroundings on each line in blockwise mode.
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

		--xoxoxoxoxoxoxoxoxxoxoxo
		require("mini.bracketed").setup({

			buffer = { suffix = "", options = {} },
			comment = { suffix = "c", options = {} },
			conflict = { suffix = "x", options = {} },
			diagnostic = { suffix = "d", options = {} },
			file = { suffix = "", options = {} },
			indent = { suffix = "i", options = {} },
			jump = { suffix = "j", options = {} },
			location = { suffix = "l", options = {} },
			oldfile = { suffix = "", options = {} },
			quickfix = { suffix = "q", options = {} },
			treesitter = { suffix = "t", options = {} },
			undo = { suffix = "", options = {} },
			window = { suffix = "w", options = {} },
			yank = { suffix = "", options = {} },
		})

		require("mini.jump").setup({
			mappings = {
				forward = "f",
				backward = "F",
				forward_till = "t",
				backward_till = "T",
				repeat_jump = ";",
			},

			-- Delay values (in ms) for different functionalities. Set any of them to
			-- a very big number (like 10^7) to virtually disable.
			delay = {
				-- Delay between jump and highlighting all possible jumps
				highlight = 250,

				-- Delay between jump and automatic stop if idle (no jump is done)
				idle_stop = 10000000,
			},

			-- Whether to disable showing non-error feedback
			-- This also affects (purely informational) helper messages shown after
			-- idle time if user input is required.
			silent = false,
		})
	end,
}
