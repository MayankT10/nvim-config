-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        {
            "rebelot/kanagawa.nvim",
            opts = {
                transparent = true,
                styles = {
                    sidebars = "transparent",
                    floats = "transparent",
                },
            },
            lazy = false,
            priority = 1000,
            config = function(_, opts)
                require("kanagawa").setup(opts)
                vim.cmd("colorscheme kanagawa-wave")

                -- -- Extra transparency tweaks
                vim.cmd([[
                hi Normal guibg=NONE ctermbg=NONE
                hi NormalNC guibg=NONE ctermbg=NONE
                hi NormalFloat guibg=NONE ctermbg=NONE
                hi FloatBorder guibg=NONE ctermbg=NONE
                hi SignColumn guibg=NONE ctermbg=NONE
                hi VertSplit guibg=NONE ctermbg=NONE
                hi StatusLine guibg=NONE ctermbg=NONE
                hi StatusLineNC guibg=NONE ctermbg=NONE
                hi LineNr guibg=NONE ctermbg=NONE
                hi EndOfBuffer guibg=NONE ctermbg=NONE
                ]])
            end,
        },
        {
            "numToStr/Comment.nvim",
            config = function()
                require("Comment").setup()
            end
        },
        {
            "akinsho/toggleterm.nvim",
            version = "*",
            config = function()
                require("toggleterm").setup()
            end
        },
        { 
            "nvim-treesitter/nvim-treesitter",
            build = ":TSUpdate",
            config = function()
                require("nvim-treesitter.configs").setup({
                    ensure_installed = {
                        "c",
                        "lua",
                        "vim",
                        "vimdoc",
                        "query",
                        "markdown",
                        "markdown_inline",
                        "java",
                        "python",
                    },
                    auto_install = true,
                    highlight = { 
                        enable = true 
                    },

                    incremental_selection = {
                        enable = true,
                        keymaps = {
                            init_selection = "<Leader>ss", 
                            node_incremental = "<Leader>si",
                            scope_incremental = "<Leader>sc",
                            node_decremental = "<Leader>sd",
                        },
                    },
                })
            end,
        },
        {
            "nvim-treesitter/nvim-treesitter-textobjects",
        }
    },
    install = { colorscheme = { "kanagawa-wave" } } ,
    checker = { enabled = true },
    defaults = {lazy = false },
})



