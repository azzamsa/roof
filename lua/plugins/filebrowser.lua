local M = {
    "nvim-telescope/telescope-file-browser.nvim",
    event = "VeryLazy",
    commit = "8e0543365fe5781c9babea7db89ef06bcff3716d",
}

function M.config()
    local actions = require("telescope._extensions.file_browser.actions")

    require("telescope").setup({
        extensions = {
            file_browser = {
                -- cwd_to_path = true,
                initial_mode = "normal",
                mappings = {
                    ["i"] = {},
                    ["n"] = {
                        ["m"] = actions.goto_parent_dir,
                        ["i"] = require("telescope.actions").select_default,
                        --
                        ["c"] = actions.create,
                        ["r"] = actions.rename,
                        -- ["M"] = actions.move,
                        ["y"] = actions.copy,
                        ["d"] = actions.remove,
                        ["H"] = actions.goto_home_dir,
                        --
                        ["f"] = actions.toggle_browser,
                        ["h"] = actions.toggle_hidden,
                        ["s"] = actions.toggle_all,
                    },
                },
            },
        },
    })
    require("telescope").load_extension("file_browser")
end

return M
