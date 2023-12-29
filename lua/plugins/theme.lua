-- Color scheme
return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        commit = "f247ee700b569ed43f39320413a13ba9b0aef0db",
        opts = {},
        config = function()
            require("tokyonight").setup({
                style = "moon",
            })
            vim.cmd.colorscheme("tokyonight")
        end,
    },
}
