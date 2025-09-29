return {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        transparent = true,
        styles = {
            sidebars = "transparent",
            floats = "transparent",
        },
    },
    config = function(_, opts)
        require("kanagawa").setup(opts)
        vim.cmd("colorscheme kanagawa-wave")
    end,
}
