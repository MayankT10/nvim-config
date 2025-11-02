require("auto-save").setup({
    events = { "InsertLeave", "BufLeave", "TextChanged" },
    exclude_ft = { "neo-tree", "gitcommit" },
    debounce_delay = 20000,
    message = "Autosaved!",
    timeout_ms = 5000,
    lsp_format = "fallback",
})
