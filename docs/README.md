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
        })
        vim.cmd.colorscheme("tokyonight")
    end,
}
```

### Catppuccin

```lua
{
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            flavour = "mocha",
            term_colors = true,
        })
        vim.cmd.colorscheme("catppuccin")
    end,
},
```

## Modus

```lua
{
    "miikanissi/modus-themes.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
        require("modus-themes").setup({
            variant = "default",
        })
        vim.cmd([[colorscheme modus_vivendi]])
    end,
},
```
