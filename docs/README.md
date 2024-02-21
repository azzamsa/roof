# Guide

## Patching dependencies

```diff
{
    "folke/tokyonight.nvim",
-    commit = "f247ee700b569ed43f39320413a13ba9b0aef0db",
+    dir = "/home/user/playground/forks/tokyonight.nvim",
}
```

## Setting up other color schemes

```lua
{
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    commit = "f247ee700b569ed43f39320413a13ba9b0aef0db",
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

```lua
{
    "rebelot/kanagawa.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    commit = "c19b9023842697ec92caf72cd3599f7dd7be4456",
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
