vim.g.mapleader = " "
vim.keymap.set("n","<leader>pv",vim.cmd.Ex)
-- vim.keymap.set("n", "<F5>", ":w<CR>:!gcc % -o %:t:r && ./%:t:r<CR>", { noremap = true })
--vim.keymap.set("n", "<F6>", function()
--  vim.cmd("w")  -- save file
--  vim.cmd("split term://gcc % -o %:r && %:r")
-- end, { noremap = true, silent = true })
-- Function to run C file in a reusable terminal







function _G.run_c_in_term()
  local src  = vim.fn.expand("%:p")    -- full path of source file
  local bin  = vim.fn.expand("%:p:r")  -- full path without extension

  vim.cmd("silent! write")

  if vim.g.c_runner_bufnr == nil or not vim.api.nvim_buf_is_valid(vim.g.c_runner_bufnr) then
    vim.cmd("botright 15split | terminal")
    vim.g.c_runner_bufnr = vim.api.nvim_get_current_buf()
    vim.g.c_runner_chanid = vim.b.terminal_job_id
  end

  vim.fn.chansend(vim.g.c_runner_chanid, "\027c")

  -- always try to (re)build, run only if build succeeded
  local cmd = "gcc \"" .. src .. "\" -o \"" .. bin .. "\" && \"" .. bin .. "\"\n"
  vim.fn.chansend(vim.g.c_runner_chanid, cmd)
end

vim.keymap.set("n", "<F6>", run_c_in_term, { noremap = true, silent = true })

