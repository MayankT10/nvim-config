local colorscheme = "kanagawa"

local is_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not is_ok then
    vim.notify("colorscheme " .. colorscheme .. " not found!")
    return
end

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

-- Make line number column transparent
vim.cmd([[
highlight LineNr guibg=NONE
highlight CursorLineNr guibg=NONE
hi SignColumn guibg=NONE ctermbg=NONE
hi DiagnosticSignError guifg=#1e1e1e guibg=NONE
hi DiagnosticSignWarn  guifg=#1e1e1e guibg=NONE
hi DiagnosticSignInfo  guifg=#1e1e1e guibg=NONE
hi DiagnosticSignHint  guifg=#1e1e1e guibg=NONE
]])
