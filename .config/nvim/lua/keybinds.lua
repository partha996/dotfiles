-- Basic keybinds
vim.keymap.set("n", "<leader>ws", "<Cmd>w<CR>")
vim.keymap.set("n", "<leader>wq", "<Cmd>wq<CR>")
vim.keymap.set("n", "<leader>q", "<Cmd>q<CR>")

-- Navigating between windows
vim.keymap.set("n", "<leader>wh", "<Cmd>wincmd h<CR>")
vim.keymap.set("n", "<leader>wj", "<Cmd>wincmd j<CR>")
vim.keymap.set("n", "<leader>wk", "<Cmd>wincmd k<CR>")
vim.keymap.set("n", "<leader>wl", "<Cmd>wincmd l<CR>")

-- Split windows
vim.keymap.set("n","<leader>vs", "<Cmd>vsplit<CR>")
vim.keymap.set("n","<leader>hs", "<Cmd>split<CR>")

-- Tab keys
vim.keymap.set("n","<leader>nt", "<Cmd>tabnew<CR>")
vim.keymap.set("n","<leader>ct", "<Cmd>tabclose<CR>")
vim.keymap.set("n","<leader>tc", "<Cmd>tabn<CR>")

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
vim.keymap.set("n", "<leader>lg", "<Cmd>LazyGit<CR>")

-- Make current buffer executable
vim.keymap.set("n", "<leader>mx", "<Cmd>!chmod +x %<CR>")

vim.keymap.set("n", "<leader>I", "<Cmd>lua TSIncrementalSelection<CR>", { noremap = true, silent = true })

-- File explorer
vim.keymap.set("n", "<leader>e", "<Cmd>NvimTreeToggle<CR>")

-- Mini Ufo fold
vim.keymap.set("n", "<leader>fo", require("ufo").openAllFolds)
vim.keymap.set("n", "<leader>fc", require("ufo").closeAllFolds)

-- Resize panes with Ctrl + Arrow Keys
vim.keymap.set("n", "<C-Up>", "<C-w>+", { desc = "Increase pane height" })
vim.keymap.set("n", "<C-Down>", "<C-w>-", { desc = "Decrease pane height" })
vim.keymap.set("n", "<C-Right>", "<C-w><", { desc = "Decrease pane width" })
vim.keymap.set("n", "<C-Left>", "<C-w>>", { desc = "Increase pane width" })

-- Equalize pane sizes
vim.keymap.set("n", "<Leader>=", "<C-w>=", { desc = "Equalize pane sizes" })

-- MiniBracketed jumps
vim.keymap.set("n", "<leader>cd", "<Cmd>lua MiniBracketed.comment('forward')<CR>")
vim.keymap.set("n", "<leader>cu", "<Cmd>lua MiniBracketed.comment('backward')<CR>")

vim.keymap.set("n", "<Leader>dd", "<Cmd>lua MiniBracketed.diagnostic('forward')<CR>")
vim.keymap.set("n", "<Leader>du", "<Cmd>lua MiniBracketed.diagnostic('backward')<CR>")

vim.keymap.set("n", "<Leader>xd", "<Cmd>lua MiniBracketed.conflict('forward')<CR>")
vim.keymap.set("n", "<Leader>xu", "<Cmd>lua MiniBracketed.conflict('backward')<CR>")

vim.keymap.set("n", "<leader>ds", vim.diagnostic.open_float, { desc = "Show diagnostics in floating window" })

-- Useless but cool animation
vim.keymap.set("n", "<leader>ca", ":CellularAutomaton make_it_rain<CR>", { noremap = true, silent = true })

-- Toggle terminal
vim.keymap.set("n", "<C-g>", "<Cmd>ToggleTerm<CR>")
vim.keymap.set("t", "<C-g>", "<Cmd>ToggleTerm<CR>")

-- Undotree
vim.keymap.set("n", "<leader>ut", "<Cmd>UndotreeToggle<CR>")
