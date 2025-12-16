vim.api.nvim_create_autocmd("FileType", {
    pattern = { "CompetiTest" },
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.linebreak = true
        vim.opt_local.breakindent = true
    end,
})
