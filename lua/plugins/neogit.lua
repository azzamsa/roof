local M = {
    "neogitorg/neogit",
    event = "VeryLazy",
    commit = "801143ee4db4121fc11a6468daae6680ba9fab51",
}

function M.config()
    local icons = require("plugins.icons")
    local neogit = require("neogit")

    neogit.setup({
        disable_signs = false,
        -- disable_hint = true,
        disable_context_highlighting = false,
        disable_commit_confirmation = true,
        disable_insert_on_commit = "auto",
        -- Neogit refreshes its internal state after specific events, which can be expensive depending on the repository size.
        -- Disabling `auto_refresh` will make it so you have to manually refresh the status after you open it.
        auto_refresh = true,
        disable_builtin_notifications = false,
        use_magit_keybindings = false,
        -- Change the default way of opening neogit
        kind = "tab",
        -- Change the default way of opening the commit popup
        commit_popup = {
            kind = "split",
        },
        -- Change the default way of opening popups
        popup = {
            kind = "split",
        },
        -- customize displayed signs
        signs = {
            -- { CLOSED, OPENED }
            section = { icons.ui.ChevronRight, icons.ui.ChevronShortDown },
            item = { icons.ui.ChevronRight, icons.ui.ChevronShortDown },
            hunk = { "", "" },
        },
        integrations = {
            diffview = true,
        },
        mappings = {
            rebase_editor = {
                ["p"] = "Pick",
                ["r"] = "Reword",
                ["e"] = "Edit",
                ["s"] = "Squash",
                ["f"] = "Fixup",
                ["x"] = "Execute",
                ["d"] = "Drop",
                ["b"] = "Break",
                ["q"] = "Close",
                ["<cr>"] = "OpenCommit",
                ["<a-e>"] = "MoveUp",
                ["<a-n>"] = "MoveDown",
                ["<c-c><c-c>"] = "Submit",
                ["<c-c><c-k>"] = "Abort",
            },
        },
    })
end

return M
