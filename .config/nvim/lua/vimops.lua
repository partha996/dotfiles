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
vim.opt.updatetime = 500
vim.opt.timeoutlen = 500
vim.opt.cmdheight = 0
vim.opt.scrolloff = 10
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.cache/nvim/undodir")
vim.opt.iskeyword:append("-")
vim.opt.encoding = "UTF_8"
vim.opt.guicursor ="n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"
vim.api.nvim_set_hl(0, "Comment", { italic = true })
-- Normal mode: Delete character under cursor without affecting clipboard
vim.keymap.set("n", "x", '"_x', { noremap = true })

-- Visual mode: Delete selected text without affecting clipboard
vim.keymap.set("v", "x", '"_x', { noremap = true })

vim.cmd("autocmd BufEnter * set formatoptions-=cro")
vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")

return {}
