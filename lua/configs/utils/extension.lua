local M = {}

function M.find_files(path)
    require("fzf-lua").files({ cwd = path })
end

function M.live_grep(path)
    require("fzf-lua").live_grep({
        cwd = path,
        winopts = {
            preview = {
                layout = "vertical",
            },
        },
    })
end

function M.bookmarks(paths)
    require("fzf-lua").fzf_exec(paths, {
        prompt = "🔖 Bookmarks> ",
        actions = {
            ["default"] = function(selection)
                require("oil").open(selection[1])
            end,
        },
    })
end

function M.projects()
    local contents = require("project_nvim").get_recent_projects()
    local reverse = {}
    for i = #contents, 1, -1 do
        reverse[#reverse + 1] = contents[i]
    end
    require("fzf-lua").fzf_exec(reverse, {
        prompt = "🗜️ Projects> ",
        actions = {
            ["default"] = function(selection)
                require("oil").open(selection[1])
            end,
            ["ctrl-d"] = function(x)
                local selection = vim.fn.confirm("Delete '" .. #x .. "' projects? ", "&Yes\n&No", 2)
                if selection == 1 then
                    local history = require("project_nvim.utils.history")
                    for _, v in ipairs(x) do
                        history.delete_project(v)
                    end
                end
            end,
        },
    })
end

function M.neogit_open(path)
    require("neogit").open({ cwd = path })
end

function M.neotree_open(path)
    require("neo-tree.command").execute({ toggle = true, dir = path })
end

function M.spectre_open(path)
    require("spectre").open({
        cwd = path,
    })
end

return M
