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
            })
            vim.cmd.colorscheme("catppuccin")
        end,
    },
}
