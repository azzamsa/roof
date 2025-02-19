-- Color scheme
return {
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
}
