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
