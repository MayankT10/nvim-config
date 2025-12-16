local opts = { noremap = true, silent = true }
vim.g.mapleader = " "

-- Code Run
-- vim.keymap.set("n", "<leader>r", "!run-rust.sh %<CR>", { desc = "Cargo run" })

-- Format Complete document
-- lua/keymaps.lua
-- vim.keymap.set('n', '<leader>h', function()
--     vim.lsp.buf.format({ async = true })
-- end, { desc = 'Format with LSP' })

-- Code runner
vim.keymap.set("n", "<leader>rr", ":RunCode<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>rf", ":RunFile<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>rft", ":RunFile tab<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>rp", ":RunProject<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>rc", ":RunClose<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>crf", ":CRFiletype<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>crp", ":CRProjects<CR>", { noremap = true, silent = false })

-- conform powered formatting
vim.keymap.set("n", "<leader>m", function()
    require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format file (conform)" })

vim.keymap.set("n", "<leader>j", function()
    require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format file (conform)" })

-- Format C++ files using clangd
-- vim.keymap.set("n", "<leader>f", function()
--   vim.lsp.buf.format({ async = true })
-- end, { desc = "Format file" })

-- Autoformat before save (only for C/C++)
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = { "*.cpp", "*.cc", "*.c", "*.h", "*.hpp" },
--   callback = function()
--     vim.lsp.buf.format({ async = false })
--   end,
-- })
--
--
-- vim.keymap.set("n", "<leader>l", function()
--     vim.diagnostic.open_float(0, {
--         scope = "line",             -- show diagnostics for current line only
--         border = "rounded",         -- rounded border
--         focusable = false,          -- float does not steal focus
--         max_width = 80,             -- wrap long lines
--         style = "minimal",          -- remove extra window decorations
--         winhighlight = "NormalFloat:Normal,FloatBorder:Normal" -- transparent look
--     })
-- end, { desc = "Show Diagnostics (Transparent Float)" })

-- Competitest
vim.keymap.set("n", "<leader>ce", function()
    require("competitest").view_stderr()
end, { desc = "View Competitest stderr output" })

vim.keymap.set("n", "<leader>co", "<cmd>CompetiTestShowOutput<CR>", { desc = "Show last output" })

-- Auto-start clangd for C/C++ files
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "c", "cpp", "h", "hpp" },
    callback = function()
        local server = vim.lsp.config["clangd"]
        if server then
            vim.lsp.start(server)
        end
    end,
})
-- vim.keymap.set("n", "<leader>M", "VGgg=")

-- clipboard
vim.keymap.set({ "v" }, "<C-C>", '"+y', { desc = "Copy to system clipboard" })
vim.keymap.set({ "v" }, "<C-y>", '"+y', { desc = "Copy to system clipboard" })

-- Nvim tree
vim.keymap.set("n", "<leader>e", ":NvimtreeToggle<CR>", opts)

-- Files keymaps
-- vim.keymap.set("n", "<leader>p", vim.cmd.Ex)
vim.keymap.set("n", "<leader>p", "<cmd>Oil<CR>")
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
vim.keymap.set("n", "<leader>T", "<cmd>ToggleTerm direction=float<CR>", { desc = "Toggle floating terminal" })
vim.keymap.set("n", "<C-`>", '<cmd>execute v:count . "ToggleTerm"<CR>')
-- Exit terminal mode
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], opts)

-- Competitest keymaps
vim.keymap.set("n", "<F2>", "<cmd>CompetiTest add_testcase<CR>", { desc = "Add Testcases" })
vim.keymap.set("n", "<F3>", "<cmd>CompetiTest edit_testcase<CR>", { desc = "Edit Testcases" })
vim.keymap.set("n", "<F4>", "<cmd>CompetiTest delete_testcase<CR>", { desc = "Delete Testcases" })
vim.keymap.set("n", "<F5>", "<cmd>CompetiTest run<CR>", { desc = "Compile and Run" })
vim.keymap.set("n", "<F6>", "<cmd>CompetiTest run_no_compile<CR>", { desc = "Run without Compiling" })

-- tabby keymaps
vim.api.nvim_set_keymap("n", "<leader>ta", ":$tabnew<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>tc", ":tabclose<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>to", ":tabonly<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>tn", ":tabn<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>tp", ":tabp<CR>", { noremap = true })
-- move current tab to previous position
vim.api.nvim_set_keymap("n", "<leader>tmp", ":-tabmove<CR>", { noremap = true })
-- move current tab to next position
vim.api.nvim_set_keymap("n", "<leader>tmn", ":+tabmove<CR>", { noremap = true })
