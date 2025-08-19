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
                -- Modus Vivendi Tinted + Catppuccin mocha
                on_colors = function(colors)
                    -- https://github.com/folke/tokyonight.nvim/blob/main/extras/lua/tokyonight_moon.lua
                    colors.bg = "#000000"
                    colors.bg_dark = "#11111b"
                    colors.bg_float = "#11111b"
                    colors.bg_popup = "#11111b"
                    colors.bg_sidebar = "#11111b"

                    colors.fg = "#ffffff"
                    colors.fg_float = "#ffffff" -- last filename in recentfile
                    colors.fg_dark = "#cdd6f4"
                    colors.fg_sidebar = "#cdd6f4"

                    colors.dark3 = "#a6adc8" -- recentfile
                    -- default color is not WCAG AAA compliant
                    colors.comment = "#a6adc8"
                end,
            })
            vim.cmd.colorscheme("tokyonight")
        end,
    },
}
