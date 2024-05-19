-- Plugins that provide apis for other plugins
return {
    {
        "nvim-lua/plenary.nvim",
    },
    {
        "nvim-tree/nvim-web-devicons",
    },
    {
        "MunifTanjim/nui.nvim",
        event = "VeryLazy",
    },
    {
        "JoosepAlviste/nvim-ts-context-commentstring",
        lazy = true,
        opts = {
            enable_autocmd = false,
        },
    },
}
