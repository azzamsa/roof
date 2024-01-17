-- Color scheme
return {
    {
        "catppuccin/nvim",
        tag = "stable",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                -- Mocha colors on macchiato background make it more readable
                flavour = "mocha", -- flavours: latte, frappe, macchiato, mocha

                color_overrides = {
                    mocha = {
                        base = "#24273a",
                    },
                },
                term_colors = true,
            })
            vim.cmd.colorscheme("catppuccin")
        end,
    },
}
