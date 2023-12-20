local M = {
    "ggandor/flit.nvim",
    commit = "f4e9af572a62c808c8de214da672f2a115a98c35",
    dependencies = {
        {
            "ggandor/leap.nvim",
            commit = "bad02b384173c8a1bb9e66dea9f50c852deef8d6",
            dependencies = {
                {
                    "tpope/vim-repeat",
                    event = "VeryLazy",
                    commit = "24afe922e6a05891756ecf331f39a1f6743d3d5a",
                },
            },
        },
    },
}

function M.config()
    require("flit").setup({
        keys = { f = "t", F = "T", t = "j", T = "J" },
        -- A string like "nv", "nvo", "o", etc.
        labeled_modes = "v",
        multiline = true,
        -- Like `leap`s similar argument (call-specific overrides).
        -- E.g.: opts = { equivalence_classes = {} }
        opts = {},
    })
end

return M
