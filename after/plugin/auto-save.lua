require('auto-save').setup({
    events = { "InsertLeave", "BufLeave", "TextChanged" },
    exclude_ft = { "neo-tree", "gitcommit" },
    debounce_delay = 2000,
    message = "Autosaved!", 
    timeout_ms = 500,
    lsp_format = "fallback",
})
