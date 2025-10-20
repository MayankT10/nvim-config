local opts = { noremap = true, silent = true }
vim.g.mapleader = " "

-- Code Run
-- vim.keymap.set("n", "<leader>r", "!run-rust.sh %<CR>", { desc = "Cargo run" })

-- Format Complete document
-- lua/keymaps.lua
-- vim.keymap.set('n', '<leader>h', function()
--     vim.lsp.buf.format({ async = true })
-- end, { desc = 'Format with LSP' })

-- conform powered formatting
vim.keymap.set("n", "<leader>m", function()
	require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format file (conform)" })

-- Nvim tree
vim.keymap.set("n", "<leader>e", ":NvimtreeToggle<CR>", opts)

-- Files keymaps
vim.keymap.set("n", "<leader>p", vim.cmd.Ex)
vim.keymap.set("n", "<leader>w", vim.cmd.w)

-- Comment Toggle
vim.keymap.set("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
vim.keymap.set("v", "<leader>/", "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", opts)

-- Moving Windows
vim.keymap.set("n", "<C-h>", "<C-w>h", { remap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { remap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { remap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { remap = true })

-- Resizing Windows
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Spliting Windows
vim.keymap.set("n", "<leader>-", "<C-W>s", { remap = true })
vim.keymap.set("n", "<leader>|", "<C-W>v", { remap = true })
vim.keymap.set("n", "<leader>wd", "<C-W>c", { remap = true })

-- Buffer
vim.keymap.set("n", "<C-t>", ":tabnew<CR>", opts)
vim.keymap.set("n", "<C-x>", ":tabclose<CR>", opts)
vim.keymap.set("n", "<leader>x", ":bd<CR>", opts) -- close the current buffer
vim.keymap.set("n", "<C-p>", ":tabprevious<CR>", opts)
vim.keymap.set("n", "<C-n>", ":tabnext<CR>", opts)

-- Floating terminal
vim.keymap.set("n", "<leader>t", "<cmd>ToggleTerm direction=float<CR>", { desc = "Toggle floating terminal" })
vim.keymap.set("n", "<C-`>", '<cmd>execute v:count . "ToggleTerm"<CR>')
-- Exit terminal mode
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], opts)

-- Competitest keymaps
vim.keymap.set("n", "<F2>", "<cmd>CompetiTest add_testcase<CR>", { desc = "Add Testcases" })
vim.keymap.set("n", "<F3>", "<cmd>CompetiTest edit_testcase<CR>", { desc = "Edit Testcases" })
vim.keymap.set("n", "<F4>", "<cmd>CompetiTest delete_testcase<CR>", { desc = "Delete Testcases" })
vim.keymap.set("n", "<F5>", "<cmd>CompetiTest run<CR>", { desc = "Compile and Run" })
vim.keymap.set("n", "<F6>", "<cmd>CompetiTest run_no_compile<CR>", { desc = "Run without Compiling" })
