local M = {
    "petertriho/nvim-scrollbar",
    event = "VeryLazy",
    commit = "35f99d559041c7c0eff3a41f9093581ceea534e8",
}

function M.config()
    require("scrollbar").setup()
end

return M
