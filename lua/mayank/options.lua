vim.opt.number = true
vim.opt.relativenumber = true
vim.o.autoread = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.wrap = true

vim.o.signcolumn = "yes"

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.clipboard = "unnamedplus"

vim.opt.scrolloff = 999
-- Dynamic scrolloff for insert mode
vim.api.nvim_create_autocmd({"InsertEnter"}, {
    pattern = "*",
    callback = function()
        vim.o.scrolloff = 12  -- more space while writing
    end,
})

vim.api.nvim_create_autocmd({"InsertLeave"}, {
    pattern = "*",
    callback = function()
        vim.o.scrolloff = 8   -- reset when leaving insert mode
    end,
})

vim.opt.virtualedit = "block"

vim.opt.inccommand = "split"

vim.opt.ignorecase = true

vim.opt.termguicolors = true

vim.opt.showmode = false
