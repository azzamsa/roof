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
                        base = "#24273a", -- macchiato: base
                        -- mocha's surface0 is too dimmed on macchiato base
                        surface0 = "#363a4f", --  macchiato: surface0
                    },
                },
                term_colors = true,
                integrations = {
                    -- default: false
                    notify = true,
                    mason = true,
                    noice = true,
                    lsp_trouble = true,
                    gitgutter = true,
                    which_key = true,
                },
            })
            vim.cmd.colorscheme("catppuccin")
        end,
    },
}
