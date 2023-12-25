local action_state = require("telescope.actions.state")
local actions = require("telescope.actions")
local finders = require("telescope.finders")
local pickers = require("telescope.pickers")
local conf = require("telescope.config").values

local M = {}

function M.bookmarks(opts)
    opts = opts or {}
    pickers
        .new(opts, {
            prompt_title = "Bookmarks",
            finder = finders.new_table({
                results = opts.bookmarks,
            }),
            sorter = conf.generic_sorter(opts),
            attach_mappings = function(prompt_bufnr, _)
                actions.select_default:replace(function()
                    actions.close(prompt_bufnr)
                    local selection = action_state.get_selected_entry()
                    local path = vim.fn.fnameescape(selection[1])
                    -- vim.cmd("e " .. path) -- Open in `oil.nvim`
                    vim.cmd("Telescope file_browser path=" .. path) -- Open in `oil.nvim`
                end)
                return true
            end,
        })
        :find()
end

return M
