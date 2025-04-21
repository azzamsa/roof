-- Color scheme
return {
    {
        "Mofiqul/dracula.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function()
            require("dracula").setup({
                colors = {
                    bg = "#000000",
                },
            })
            vim.cmd.colorscheme("dracula")
        end,
    },
}
