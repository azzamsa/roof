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
    -- Convenience File operations
    {
        "chrisgrieser/nvim-genghis",
        event = "VeryLazy",
        commit = "1c43cf140bc2d9cb09fb81455a469ee6aadfca5d",
        dependencies = {
            "stevearc/dressing.nvim",
            commit = "8b7ae53d7f04f33be3439a441db8071c96092d19",
        },
    },
}
