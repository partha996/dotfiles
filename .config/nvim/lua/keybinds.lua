--Basic keybinds
vim.keymap.set("n", "<leader>ws", "<Cmd>w<CR>", { desc = "write into a buffer" })
vim.keymap.set("n", "<leader>wq", "<Cmd>wq<CR>", { desc = "write & close a buffer" })
vim.keymap.set("n", "<leader>q", "<Cmd>q<CR>", { desc = "close buffer" })
vim.keymap.set("n", "<leader>o", "<Cmd>call append(line('.'), '')<CR>", { desc = "add empty line below" })
vim.keymap.set("n", "<leader>O", "<Cmd>call append(line('.') - 1, '')<CR>", { desc = "add empty line above" })
vim.keymap.set("n", "<leader>j", '"_d', { desc = "permanently delete motion" })
vim.keymap.set("n", "gx", [[:silent execute '!zen-browser ' . shellescape(expand('<cfile>'), 1)<CR>]])

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
vim.keymap.set("n","<leader>rt",vim.lsp.buf.rename, {})

-- Lsp symbol Navbuddy window
vim.keymap.set("n", "<leader>nv", "<cmd>Navbuddy<CR>", { desc = "Toggle Outline" })

-- code formatter
vim.keymap.set("n", "<leader>mp", function()require("conform").format()end)

-- Yank the whole buffer
vim.keymap.set("n", "<leader>cb", "<Cmd>normal! ggVGy<C-o><CR>", { silent = true })

-- Delete buffer from the memory
vim.keymap.set("n", "<leader>bd", "<cmd>bd<CR>", { desc = "Delete current buffer" })

-- Diagnostic jumps up
vim.keymap.set("n", "<leader>du", function()vim.diagnostic.goto_prev({ float = false })end, { desc = "Go to previous diagnostic" })

-- Diagnostic jumps down
vim.keymap.set("n", "<leader>dd", function()vim.diagnostic.goto_next({ float = false })end, { desc = "Go to next diagnostic" })

-- Define snacks
local snacks = require("snacks")

-- Snacks.lazygit
vim.keymap.set("n", "<leader>lg", function()snacks.lazygit()end, { desc = "lazygit" })

-- Snacks.gitbrowse
vim.keymap.set("n", "<leader>gz", function()snacks.gitbrowse()end, { desc = "gitbrowser" })

-- Snacks.notifier hide
vim.keymap.set("n", "<leader>un", function()snacks.notifier.hide()end, { desc = "hide notifications" })

-- Snacks.git blame_line
vim.keymap.set("n", "<leader>gb", function()snacks.git.blame_line()end, { desc = "git blame" })

-- Snacks.git log
vim.keymap.set("n", "<leader>gl", function()snacks.picker.git_log()end)

-- Snacks.rename_file
vim.keymap.set("n", "<leader>rb", function()snacks.rename.rename_file()end, { desc = "reaname current buffer" })

-- Snacks.picker lsp_symbols
vim.keymap.set("n", "<leader>sl", function()snacks.picker.lsp_symbols({ layout = "right" })end, { desc = "treesitter" })

-- Snacks.picker smart_file
vim.keymap.set("n", "<leader>ff", function()snacks.picker.files({ layout = "telescope" })end, { desc = "file picker" })

-- Snacks.picker zoxide
vim.keymap.set("n", "<leader>zf", function()snacks.picker.zoxide()end, { desc = "zoxide search " })

-- Snacks.picker buffers
vim.keymap.set("n", "<leader>sb", function()snacks.picker.buffers({ layout = "select" })end, { desc = "find open buffers" })

-- Snacks.picker register
vim.keymap.set("n", "<leader>rg", function()snacks.picker.registers()end, { desc = "registers" })

-- Snacks.picker command_history
vim.keymap.set("n", "<leader>ch", function()snacks.picker.command_history({ layout = "select" })end, { desc = "command history" })

-- Snacks.picker man
vim.keymap.set("n", "<leader>ms", function()snacks.picker.man()end, { desc = "man pages" })

-- Snacks.picker keymaps
vim.keymap.set("n", "<leader>kp", function()snacks.picker.keymaps({ layout = "ivy" })end, { desc = "keymaps picker" })

-- Snacks.picker undo
vim.keymap.set("n", "<leader>ut", function()snacks.picker.undo({ layout = "ivy" })end, { desc = "change history recorder" })

-- Snacks.picker spelling
vim.keymap.set("n", "<leader>ss", function()snacks.picker.spelling({ layout = "select" })end, { desc = "word picker" })

-- Snacks.picker marks
vim.keymap.set("n", "<leader>sm", function()snacks.picker.marks()end, { desc = "marks" })

-- Snacks.picker grep
vim.keymap.set("n", "<leader>vp", function()snacks.picker.marks({layout = "telescope"})end, { desc = "grep in the cwd" })

-- Snacks.picker grep_buffers
vim.keymap.set("n", "<leader>gp", function()snacks.picker.grep_buffers()end, { desc = "grep inside of only open buffers" })

-- Snacks.words jump
vim.keymap.set("n", "[[", function()snacks.words.jump(vim.v.count1)end)
vim.keymap.set("n", "]]", function()snacks.words.jump(-vim.v.count1)end)

-- Scratchpad
-- vim.keymap.set("n", "<leader>sc", "<Cmd>lua Snacks.scratch()<CR>")

-- File explorer(snacks's picker)
vim.keymap.set("n", "<leader>e", "<Cmd>lua Snacks.explorer()<CR>", { desc = "open file explorer" })

-- notifications
vim.keymap.set("n","<leader>sn","<Cmd>lua Snacks.picker.notifications()<CR>", { desc = "show notifictions in picker" })

-- Make current buffer executable
vim.keymap.set("n", "<leader>mx", "<Cmd>!chmod +x %<CR>", { desc = "make file executable" })

-- Ufo fold
vim.keymap.set("n", "<leader>fo", require("ufo").openAllFolds)
vim.keymap.set("n", "<leader>fc", require("ufo").closeAllFolds)

-- Peek inside a fold
vim.keymap.set("n", "zk", function()
	local winid = require("ufo").peekFoldedLinesUnderCursor()
	if not winid then
		vim.lsp.buf.hover()
	end
end, { desc = "peek inside the fold" })

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

--Mini Mics window fullscreen
vim.keymap.set("n", "<Leader>fw", function()require("mini.misc").zoom()end, { desc = "make current focus window fullscreen" })

-- Useless cool animation
vim.keymap.set("n", "<leader>ca", "<Cmd>CellularAutomaton make_it_rain<CR>", { noremap = true, silent = true })


-- Trouble
vim.keymap.set(	"n","<leader>st","<Cmd>Trouble diagnostics toggle filter.buf=0<CR>", { desc = "Diagnostics (Trouble)" })


-- Rendering Markdown files
vim.keymap.set("n", "<leader>am", "<Cmd>Markview Toggle<CR>", { desc = "toggle markdown renderings " })

-- Debugger
vim.keymap.set("n", "<leader>dt", require("dap").toggle_breakpoint, {})
vim.keymap.set("n", "<leader>dc", require("dap").continue, {})
vim.keymap.set("n", "<leader>di", "<Cmd>DapStepInto<Cr>", {})
vim.keymap.set("n", "<leader>do", "<Cmd>DapStepOut<Cr>", {})
