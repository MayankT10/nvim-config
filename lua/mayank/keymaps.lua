local opts = { noremap = true, silent = true }
vim.g.mapleader = " "

-- Files keymaps
vim.keymap.set("n", "<leader>p", vim.cmd.Ex)
vim.keymap.set("n", "<leader>w", vim.cmd.w)

-- Comment Toggle
vim.keymap.set("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
vim.keymap.set("v", "<leader>/", "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", opts)

-- Moving Windows
vim.keymap.set("n","<C-h>","<C-w>h", opts)
vim.keymap.set("n","<C-j>","<C-w>j", opts)
vim.keymap.set("n","<C-k>","<C-w>k", opts)
vim.keymap.set("n","<C-l>","<C-w>l", opts)

-- Resizing Windows
vim.keymap.set("n","<C-Up>", ":resize -2<CR>",opts)
vim.keymap.set("n","<C-Down>", ":resize +2<CR>",opts)
vim.keymap.set("n","<C-Left>", ":vertical resize -2<CR>",opts)
vim.keymap.set("n","<C-Right>", ":vertical resize +2<CR>",opts)

-- Spliting Windows
vim.keymap.set("n","<leader>-","<C-W>s", { remap = true })
vim.keymap.set("n","<leader>|","<C-W>v", { remap = true })
vim.keymap.set("n","<leader>wd","<C-W>c", {remap = true })

-- Buffer
vim.keymap.set("n","<C-t>", ":tabnew<CR>",opts)
vim.keymap.set("n","<C-x>", ":tabclose<CR>",opts)
vim.keymap.set("n","<leader>x", ":bd<CR>",opts) -- close the current buffer
vim.keymap.set("n","<C-p>", ":tabprevious<CR>",opts)
vim.keymap.set("n","<C-n>", ":tabnext<CR>",opts)

-- Floating terminal
vim.keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", { desc = "Toggle floating terminal" })
vim.keymap.set("n", "<C-`>", '<cmd>execute v:count . "ToggleTerm"<CR>')
-- Exit terminal mode
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]],opts)

