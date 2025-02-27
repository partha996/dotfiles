local telescope = require('telescope.builtin')

-- Define the path to your Neovim configuration directory
local nvim_config_dir = vim.fn.stdpath('config')

-- Create a custom command to list files in the Neovim config directory
vim.api.nvim_create_user_command('OpenNvimConfigFiles', function()
  telescope.find_files({
    prompt_title = 'Neovim Config Files',
    cwd = nvim_config_dir,  -- Set the current working directory to your Neovim config directory
  })
end, {})

-- restore cursor position on file open
vim.api.nvim_create_autocmd("BufReadPost", {
	pattern = "*",
	callback = function()
		local line = vim.fn.line("'\"")
		if line > 1 and line <= vim.fn.line("$") then
			vim.cmd("normal! g'\"")
		end
	end,
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("HighlightYank", {}),
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch", -- Highlight group to use
			timeout = 200, -- Duration of the highlight in milliseconds
		})
	end,
})

