-- Plugins that provide apis for other plugins

local M = {
    -- Neotree, Neogit depends on
    {
        "nvim-lua/plenary.nvim",
        commit = "55d9fe89e33efd26f532ef20223e5f9430c8b0c0",
    },
    -- Neotre, Trouble depens on
    {
        "nvim-tree/nvim-web-devicons",
        commit = "aff5f50b34754335a312c9b3dc5b245f605ce437",
    },
    {
        -- Noice depens on
        "MunifTanjim/nui.nvim",
        event = "VeryLazy",
        commit = "c9b4de623d19a85b353ff70d2ae9c77143abe69c",
    },
}

return M
