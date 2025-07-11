-- Color scheme
return {
    {
        "miikanissi/modus-themes.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function()
            require("modus-themes").setup({
                variant = "tinted",
                on_colors = function(colors)
                    -- https://github.com/miikanissi/modus-themes.nvim/blob/master/lua/modus-themes/colors.lua#L348
                    colors.bg_main = "#000000"
                    colors.bg_dim = "#11111b"
                    colors.bg_hl_line = "#1e1e2e"
                end,
                on_highlights = function(highlights, colors)
                    highlights.WinBarNC = { bg = colors.bg_tab_current }
                end,
            })
            vim.cmd([[colorscheme modus_vivendi]])
        end,
    },
}
