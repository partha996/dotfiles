vim.opt.clipboard:append("unnamedplus")
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.smoothscroll = true
vim.opt.ttyfast = true
vim.opt.termguicolors = true
vim.opt.syntax = "off"
-- vim.opt.numberwidth = 8
vim.opt.signcolumn = "yes"
vim.o.updatetime = 100
vim.opt.relativenumber = true
vim.opt.cmdheight = 0

-- Normal mode: Delete character under cursor without affecting clipboard
vim.keymap.set('n', 'x', '"_x', { noremap = true })

-- Visual mode: Delete selected text without affecting clipboard
vim.keymap.set('v', 'x', '"_x', { noremap = true })

vim.cmd("autocmd BufEnter * set formatoptions-=cro")
vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")


-- Show diagnostics in a floating window on hover
-- vim.diagnostic.config({
-- 	virtual_text = true, -- Disable virtual text
-- 	float = {
-- 		source = "always", -- Show the source of the diagnostic
-- 		focusable = false, -- Don't allow focus on the floating window
-- 	},
-- })
--
-- vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
-- 	pattern = "*.lua",
-- 	pattern = "*.java",
-- 	pattern = "*.c",
-- 	pattern = "*.cpp",
-- 	callback = function()
-- 		vim.diagnostic.hide()
-- 		vim.defer_fn(function()
-- 			vim.diagnostic.show()
-- 		end, 100)
-- 	end,
-- })
-- Keybinding to show diagnostics in a floating window
return {}
