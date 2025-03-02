-- Basic keybinds
vim.keymap.set("n","<leader>ws", "<Cmd>w<CR>")
vim.keymap.set("n","<leader>wq", "<Cmd>wq<CR>")
vim.keymap.set("n","<leader>q", "<Cmd>q<CR>")

-- For lsp
vim.keymap.set("n", "<leader>hv", vim.lsp.buf.hover, {})
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
vim.keymap.set("n", "<leader>mp", vim.lsp.buf.format, {})

-- Telescope keybinds
vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files)
vim.keymap.set("n", "<leader>m", require("telescope.builtin").man_pages)
vim.keymap.set("n", "<leader>fz", require("telescope.builtin").current_buffer_fuzzy_find)
vim.keymap.set("n", "<leader>lf", require("telescope.builtin").live_grep)
vim.keymap.set("n", "<leader>t", require("telescope.builtin").buffers)
vim.keymap.set("n", "<leader>r", require("telescope.builtin").registers)
vim.keymap.set("n", "<leader>ss", require("telescope.builtin").spell_suggest)
vim.keymap.set("n", "<leader>a", require("telescope.builtin").treesitter)

-- Lazygit
vim.keymap.set("n","<leader>lg", "<Cmd>LazyGit<CR>")

-- make current buffer executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>")

vim.keymap.set("n", "<leader>I", ":TSIncrementalSelection<CR>", { noremap = true, silent = true })

-- For mini file tree
vim.keymap.set("n", "<leader>e", "<Cmd>lua MiniFiles.open()<CR>")

-- Resize panes with Ctrl + Arrow Keys
vim.keymap.set("n", "<C-Up>", "<C-w>+", { desc = "Increase pane height" })
vim.keymap.set("n", "<C-Down>", "<C-w>-", { desc = "Decrease pane height" })
vim.keymap.set("n", "<C-Left>", "<C-w><", { desc = "Decrease pane width" })
vim.keymap.set("n", "<C-Right>", "<C-w>>", { desc = "Increase pane width" })

-- Equalize pane sizes
vim.keymap.set("n", "<Leader>=", "<C-w>=", { desc = "Equalize pane sizes" })

-- MiniBracketed jumps
vim.keymap.set("n", "<leader>cf", "<Cmd>lua MiniBracketed.comment('forward')<CR>")
vim.keymap.set("n", "<leader>cb", "<Cmd>lua MiniBracketed.comment('backward')<CR>")

vim.keymap.set("n", "<Leader>wH", "<Cmd>lua MiniBracketed.window('first')<CR>")
vim.keymap.set("n", "<Leader>wk", "<Cmd>lua MiniBracketed.window('forward')<CR>")
vim.keymap.set("n", "<Leader>wk", "<Cmd>lua MiniBracketed.window('backward')<CR>")
vim.keymap.set("n", "<Leader>wL", "<Cmd>lua MiniBracketed.window('last')<CR>")

vim.keymap.set("n", "<Leader>dn", "<Cmd>lua MiniBracketed.diagnostic('forward')<CR>")
vim.keymap.set("n", "<Leader>dp", "<Cmd>lua MiniBracketed.diagnostic('backward')<CR>")

vim.keymap.set("n", "<Leader>xn", "<Cmd>lua MiniBracketed.conflict('forward')<CR>")
vim.keymap.set("n", "<Leader>xp", "<Cmd>lua MiniBracketed.conflict('backward')<CR>")

vim.keymap.set("n", "<leader>ds", vim.diagnostic.open_float, { desc = "Show diagnostics in floating window" })

-- Useless but cool animation
vim.keymap.set("n", "<leader>ca", ":CellularAutomaton make_it_rain<CR>", { noremap = true, silent = true })

-- Toggle terminal
vim.keymap.set("n", "<C-g>", "<Cmd>ToggleTerm<CR>")
vim.keymap.set("t", "<C-g>", "<Cmd>ToggleTerm<CR>")

-- Undotree
vim.keymap.set("n", "<leader>ut", "<Cmd>UndotreeToggle<CR>")
