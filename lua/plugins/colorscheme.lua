-- Color scheme
return {
    {
        "folke/tokyonight.nvim",
        tag = "stable",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function()
            require("tokyonight").setup({
                style = "moon",
            })
            vim.cmd.colorscheme("tokyonight")
        end,
    },
}
