local M = {
    "nvim-neo-tree/neo-tree.nvim",
    commit = "77d9f484b88fd380386b46ed9206e5374d69d9d8",
    cmd = "Neotree",
}

function M.config()
    require("neo-tree").setup({})
end

return M
