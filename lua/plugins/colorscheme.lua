-- Color scheme
return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "mocha",
                term_colors = true,
                color_overrides = {
                    mocha = {
                        -- overlay0 was too dim, so I switched to overlay1.
                        overlay0 = "#7f849c",
                        -- Catppuccin black
                        base = "#000000",
                        mantle = "#000000",
                        crust = "#000000",
                    },
                },
            })
            vim.cmd.colorscheme("catppuccin")
        end,
    },
}
