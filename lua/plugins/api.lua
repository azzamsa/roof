-- Plugins that provide apis for other plugins
return {
    {
        "nvim-lua/plenary.nvim",
        commit = "55d9fe89e33efd26f532ef20223e5f9430c8b0c0",
    },
    {
        "nvim-tree/nvim-web-devicons",
        commit = "aff5f50b34754335a312c9b3dc5b245f605ce437",
    },
    {
        "MunifTanjim/nui.nvim",
        event = "VeryLazy",
        commit = "c9b4de623d19a85b353ff70d2ae9c77143abe69c",
    },
    {
        "JoosepAlviste/nvim-ts-context-commentstring",
        commit = "1277b4a1f451b0f18c0790e1a7f12e1e5fdebfee",
        lazy = true,
        opts = {
            enable_autocmd = false,
        },
    },
}
