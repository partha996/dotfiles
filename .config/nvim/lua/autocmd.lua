-- Restore cursor position on file open
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
		vim.hl.on_yank({
			higroup = "IncSearch", -- Highlight group to use
			on_macro = true,
			timeout = 200, -- Duration of the highlight in milliseconds
		})
	end,
})

-- remove Highlight after 5s
local function Clean_highlight()
	vim.defer_fn(function()
		if vim.v.hlsearch == 1 then
			vim.cmd("nohlsearch")
		end
	end, 5000)
end

vim.keymap.set("n", "n", function()
	vim.cmd("normal! n")
	Clean_highlight()
end, { noremap = true, silent = true })

vim.keymap.set("n", "N", function()
	vim.cmd("normal! N")
	Clean_highlight()
end, { noremap = true, silent = true })

-- Remove Highlight after Search
vim.api.nvim_create_autocmd("CmdLineLeave", {
	pattern = "[/?]",
	callback = function()
		Clean_highlight()
	end,
})

-- Toggle relative & absolute line numbers on window enter & leave
vim.api.nvim_create_autocmd({ "WinEnter", "WinLeave" }, {
	pattern = { "*.c", "*.cpp", "*.py", "*.lua", "*.java", "*.js", "*.css", "*.html", "*.R", "*.sh", "*.md" },
	callback = function(args)
		local is_entering = args.event == "WinEnter"
		vim.opt.relativenumber = is_entering
	end,
})

--Toggle relative & absolute line numbers on inser mode enter & leave
vim.api.nvim_create_autocmd({ "InsertEnter", "InsertLeave" }, {
	pattern = { "*.c", "*.cpp", "*.py", "*.lua", "*.java", "*.js", "*.css", "*.html", "*.R", "*.sh", "*.md" },
	callback = function(args)
		local is_in_insert = args.event == "InsertLeave"
		vim.opt_local.relativenumber = is_in_insert
	end,
})

--Toggle relative & absolute line numbers on focus enter & leave
vim.api.nvim_create_autocmd({ "FocusLost", "FocusGained" }, {
	pattern = { "*.c", "*.cpp", "*.py", "*.lua", "*.java", "*.js", "*.css", "*.html", "*.R", "*.sh", "*.md" },
	callback = function(args)
		local is_focused = args.event
		if args.event == "FocusLost" then
			vim.opt.relativenumber = false
		else
			vim.opt.relativenumber = true
		end
	end,
})

--Load saved content of the file(mark,folds,etc)
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	pattern = "*",
	command = "silent! loadview",
})

-- Save content of the file
vim.api.nvim_create_autocmd({ "BufWinLeave" }, {
	pattern = "*",
	callback = function()
		if vim.fn.expand("%") == "" or vim.bo.buftype ~= "" then
			return -- Don't run mkview on unnamed or special buffers
		end
	end,
})
