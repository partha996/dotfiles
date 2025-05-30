--Basic keybinds
vim.keymap.set("n", "<leader>ws", "<Cmd>w<CR>", { desc = "write into a buffer" })
vim.keymap.set("n", "<leader>wq", "<Cmd>wq<CR>", { desc = "write & close a buffer" })
vim.keymap.set("n", "<leader>q", "<Cmd>q<CR>", { desc = "close buffer" })
vim.keymap.set("n", "<leader>o", "<Cmd>call append(line('.'), '')<CR>", { desc = "add empty line below" })
vim.keymap.set("n", "<leader>O", "<Cmd>call append(line('.') - 1, '')<CR>", { desc = "add empty line above" })
vim.keymap.set("n", "<leader>j", '"_d', { desc = "permanently delete motion" })

-- Navigating between windows
vim.keymap.set("n", "<leader>wh", "<Cmd>wincmd h<CR>", { desc = "foucus rightwin" })
vim.keymap.set("n", "<leader>wj", "<Cmd>wincmd j<CR>", { desc = "focus downwin" })
vim.keymap.set("n", "<leader>wk", "<Cmd>wincmd k<CR>", { desc = "focus upwin" })
vim.keymap.set("n", "<leader>wl", "<Cmd>wincmd l<CR>", { desc = "foucus leftwin" })

-- Split windows
vim.keymap.set("n", "<leader>vs", "<Cmd>vsplit<CR>", { desc = "vertical split" })
vim.keymap.set("n", "<leader>hs", "<Cmd>split<CR>", { desc = "horizontal split" })

-- Tab keys
vim.keymap.set("n", "<leader>nt", "<Cmd>tabnew<CR>", { desc = "new tab" })
vim.keymap.set("n", "<leader>ct", "<Cmd>tabclose<CR>", { desc = "close tab" })
vim.keymap.set("n", "<leader>tc", "<Cmd>tabn<CR>", { desc = "cycle tabs" })

-- For lsp
vim.keymap.set("n", "<leader>hv", vim.lsp.buf.hover, {})
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "<leader>cs", vim.lsp.buf.code_action, {})
vim.keymap.set("n", "<leader>mp", vim.lsp.buf.format, {})

-- Yank the whole buffer
vim.keymap.set("n", "<leader>cb", "<Cmd>normal! ggVGy<C-o><CR>", { silent = true })

-- Delete buffer from the memory
vim.keymap.set("n", "<leader>bd", "<cmd>bd<CR>", { desc = "Delete current buffer" })

-- Diagnostic jumps
vim.keymap.set("n", "<leader>du", function()
	vim.diagnostic.goto_prev({ float = false })
end, { desc = "Go to previous diagnostic without popup" })

vim.keymap.set("n", "<leader>dd", function()
	vim.diagnostic.goto_next({ float = false })
end, { desc = "Go to next diagnostic without popup" })

-- Snacks keybinds
vim.keymap.set("n", "<leader>lg", function()
	require("snacks").lazygit()
end, { desc = "lazygit" })

vim.keymap.set("n", "<leader>gz", function()
	require("snacks").gitbrowse()
end, { desc = "gitbrowser" })

vim.keymap.set("n", "<leader>un", function()
	require("snacks").notifier.hide()
end, { desc = "hide notifications" })

vim.keymap.set("n", "<leader>gb", function()
	require("snacks").git.blame_line()
end, { desc = "git blame" })

vim.keymap.set("n", "<leader>rb", function()
	require("snacks").rename.rename_file()
end, { desc = "reaname current buffer" })

vim.keymap.set("n", "<leader>sl", function()
	require("snacks").picker.lsp_symbols({ layout = "right" })
end, { desc = "treesitter" })

vim.keymap.set("n", "<leader>ff", function()
	require("snacks").picker.files()
end, { desc = "file picker" })

vim.keymap.set("n", "<leader>zf", function()
	require("snacks").picker.zoxide()
end, { desc = "zoxide search " })

vim.keymap.set("n", "<leader>sb", function()
	require("snacks").picker.buffers()
end, { desc = "find open buffers" })

vim.keymap.set("n", "<leader>rg", function()
	require("snacks").picker.registers()
end, { desc = "registers" })

vim.keymap.set("n", "<leader>ch", function()
	require("snacks").picker.command_history({ layout = "select" })
end, { desc = "command history" })

vim.keymap.set("n", "<leader>ms", function()
	require("snacks").picker.man()
end, { desc = "man pages" })

vim.keymap.set("n", "<leader>kp", function()
	require("snacks").picker.keymaps({ layout = "ivy" })
end, { desc = "keymaps picker" })

vim.keymap.set("n", "<leader>up", function()
	require("snacks").picker.undo({ layout = "ivy" })
end, { desc = "change history recorder" })

vim.keymap.set("n", "<leader>ss", function()
	require("snacks").picker.spelling({ layout = "select" })
end, { desc = "word picker" })

vim.keymap.set("n", "<leader>sm", function()
	require("snacks").picker.marks()
end, { desc = "marks" })


-- Make current buffer executable
vim.keymap.set("n", "<leader>mx", "<Cmd>!chmod +x %<CR>", { desc = "make file executable" })

-- File explorer(snacks's picker)
vim.keymap.set("n", "<leader>e", "<Cmd>lua Snacks.explorer()<CR>", { desc = " open file explorer" })

-- Ufo fold
vim.keymap.set("n", "<leader>fo", require("ufo").openAllFolds)
vim.keymap.set("n", "<leader>fc", require("ufo").closeAllFolds)

-- Resize panes with Ctrl + Arrow Keys
-- vim.keymap.set("n", "<C-Up>", "<C-w>+", { desc = "Increase pane height" })
-- vim.keymap.set("n", "<C-Down>", "<C-w>-", { desc = "Decrease pane height" })
-- vim.keymap.set("n", "<C-Right>", "<C-w><", { desc = "Decrease pane width" })
-- vim.keymap.set("n", "<C-Left>", "<C-w>>", { desc = "Increase pane width" })

-- Equalize pane sizes
vim.keymap.set("n", "<Leader>=", "<C-w>=", { desc = "Equalize pane sizes" })

-- MiniBracketed jumps
vim.keymap.set("n", "<leader>cd", "<Cmd>lua MiniBracketed.comment('forward')<CR>", { desc = "jump up comment" })
vim.keymap.set("n", "<leader>cu", "<Cmd>lua MiniBracketed.comment('backward')<CR>", { desc = "jump down comment" })

vim.keymap.set("n", "<Leader>xd", "<Cmd>lua MiniBracketed.conflict('forward')<CR>", { desc = "jump conflict up" })
vim.keymap.set("n", "<Leader>xu", "<Cmd>lua MiniBracketed.conflict('backward')<CR>", { desc = "jump conflict down" })

-- Trial space remover
vim.keymap.set("n", "<Leader>tr", "<Cmd>lua MiniTrailspace.trim()<CR>", { desc = "Remove tralling spaces " })

-- Useless but cool animation
vim.keymap.set(
	"n",
	"<leader>ca",
	"<Cmd>CellularAutomaton make_it_rain<CR>",
	{ noremap = true, silent = true },
	{ desc = "cool animation" }
)

-- Toggle terminal
vim.keymap.set("n", "<C-g>", "<Cmd>ToggleTerm<CR>")
vim.keymap.set("t", "<C-g>", "<Cmd>ToggleTerm<CR>")

-- Trouble
vim.keymap.set("n", "<leader>st", "<Cmd>Trouble diagnostics focus<CR>", { desc = "Diagnostics (Trouble)" })

-- Navbuddy
vim.keymap.set("n", "<leader>so", "<Cmd>Navbuddy<CR>", { desc = "Open navbuddy" })

-- Undotree
vim.keymap.set(
	"n",
	"<leader>ut",
	"<Cmd>UndotreeToggle<CR>|<Cmd>UndotreeFocus<CR>",
	{ desc = "Toggle Undotree & focus" }
)

-- Rendering Markdown files
vim.keymap.set("n", "<leader>am", "<Cmd>Markview Toggle<CR>", { desc = "toggle markdown renderings " })

-- Debugger
vim.keymap.set("n", "<leader>dt", require("dap").toggle_breakpoint, {})
vim.keymap.set("n", "<leader>dc", require("dap").continue, {})
