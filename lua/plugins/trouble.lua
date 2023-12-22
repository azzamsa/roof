local M = {
    "folke/trouble.nvim",
    dependencies = {
        {
            "nvim-tree/nvim-web-devicons",
            commit = "aff5f50b34754335a312c9b3dc5b245f605ce437",
        },
    },
    opts = { use_diagnostic_signs = true },
}

-- Available commands
-- { "key", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics" },
-- { "key", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics" },
-- { "key", "<cmd>TroubleToggle loclist<cr>", desc = "Location List" },
-- { "key", "<cmd>TroubleToggle quickfix<cr>", desc = "Quickfix List" },

return M
