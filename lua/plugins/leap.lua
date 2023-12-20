local M = {
    "ggandor/leap.nvim",
    commit = "bad02b384173c8a1bb9e66dea9f50c852deef8d6",
    dependencies = {
        {
            "tpope/vim-repeat",
            event = "VeryLazy",
            commit = "24afe922e6a05891756ecf331f39a1f6743d3d5a",
        },
    },
    keys = {
        { "s", mode = { "n", "x", "o" }, desc = "Leap forward to" },
        { "S", mode = { "n", "x", "o" }, desc = "Leap backward to" },
        { "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
    },
    config = function(_, opts)
        local leap = require("leap")
        for k, v in pairs(opts) do
            leap.opts[k] = v
        end
        leap.add_default_mappings(true)
        vim.keymap.del({ "x", "o" }, "x")
        vim.keymap.del({ "x", "o" }, "X")
    end,
}

return M
