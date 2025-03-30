return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"lua",
					"c",
					"cpp",
					"java",
					"bash",
					"html",
					"css",
					"vim",
					"query",
					"vimdoc",
					"python",
					"json",
					"toml",
				},
				highlight = { enable = true },
				indent = { enable = true },
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<C-s>",
						node_incremental = "<C-s>",
						scope_incremental = false,
						node_decremental = "<bs>",
					},
				},
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("nvim-treesitter.configs").setup({
				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["il"] = "@loop.inner",
							["al"] = "@loop.outer",
							["aa"] = "@conditional.outer",
							["ii"] = "@conditional.inner",
							["ap"] = "@parameter.outer",
							["ip"] = "@parameter.outer",
							["ac"] = "@class.outer",
							["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
							["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
						},
						include_surrounding_whitespace = true,
					},
					swap = {
						enable = true,
						swap_next = {
							["<leader>ps"] = "@parameter.inner", --swap parameter/argument with next
							["<leader>fs"] = "@function.outer", -- same with function
						},
						swap_previous = {
							["<leader>pa"] = "@parameter.inner", --swap parameter/argument with next
							["<leader>pm"] = "@function.outer", -- same with function
						},
					},
				},
			})
		end,
	},
}
