local M = {
    "stevearc/oil.nvim",
    event = "VeryLazy",
    commit = "24027ed8d7f3ee5c38cfd713915e2e16d89e79b3",
}

function M.config()
    require("oil").setup({
        -- Send deleted files to the trash instead of permanently deleting them (:help oil-trash)
        delete_to_trash = true,
        -- Skip the confirmation popup for simple operations
        skip_confirm_for_simple_edits = false,
        -- Selecting a new/moved/renamed file or directory will prompt you to save changes first
        prompt_save_on_select_new_entry = true,
        -- Set to false to disable all of the above keymaps
        use_default_keymaps = true,
        view_options = {
            sort = {
                -- sort order can be "asc" or "desc"
                -- see :help oil-columns to see which columns are sortable
                { "mtime", "desc" },
            },
        },
    })
end

return M
