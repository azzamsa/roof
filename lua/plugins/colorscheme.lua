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
                -- `night` has the most darker bg
                style = "moon",
                on_colors = function(colors)
                    colors.bg = "#000000"
                    colors.fg = "#ffffff"
                    -- default color is not WCAG AAA compliant
                    colors.comment = "#a9b1d6"
                end,
            })
            vim.cmd.colorscheme("tokyonight")
        end,
    },
}
