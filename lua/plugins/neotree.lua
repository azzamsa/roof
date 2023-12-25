local M = {
    "nvim-neo-tree/neo-tree.nvim",
    commit = "77d9f484b88fd380386b46ed9206e5374d69d9d8",
    cmd = "Neotree",
}

function M.config()
    require("neo-tree").setup({
        filesystem = {
            follow_current_file = {
                -- This will use the OS level file watchers to detect changes
                use_libuv_file_watcher = true,
            },
        },
    })
end

return M
