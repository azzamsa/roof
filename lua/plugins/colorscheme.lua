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
                on_colors = function(colors)
                    colors.bg = "#000000"
                end,
            })
            vim.cmd.colorscheme("tokyonight")
        end,
    },
}
