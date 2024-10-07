# Guide

## Setting up other color schemes

### Tokyonight

```lua
{
    "folke/tokyonight.nvim",
    tag = "stable",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
        require("tokyonight").setup({
            style = "moon",
            -- style = "day",
            on_colors = function(colors)
                -- Kanagawa fujiWhite is brighter to me than the default `fg`
                colors.fg = "#dcd7ba" -- Kanagawa fujiWhite
                -- colors.fg = "#c8c093" -- Kanagawa oldWhite
                end,
        })
        vim.cmd.colorscheme("tokyonight")
    end,
}
```

### Kanagawa

```lua
{
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("kanagawa").setup({
            colors = {
                palette = {
                    -- oniViolet is too dark for me
                    -- Replacement: `Tokyonight Night purle`
                    oniViolet = "#9d7cd8", -- default: #957FB8
                },
                theme = {
                    all = {
                        ui = {
                            bg_gutter = "none",
                            -- waveBlue1 is too dark for me. Hard to distinguish
                            -- bg_visual = "#1d4f67", -- waveblue2, default: waveblue1
                        },
                    },
                },
            },
        })
        vim.cmd.colorscheme("kanagawa")
        -- vim.cmd.colorscheme("kanagawa-lotus")
    end,
},
```

### Catppuccin

```lua
{
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            -- flavours: latte, frappe, macchiato, mocha
            -- flavour = "mocha", -- night
            flavour = "latte", -- day
            background = {
                light = "latte",
                dark = "mocha",
            },
            term_colors = true,
        })
        vim.cmd.colorscheme("catppuccin")
    end,
},
```
