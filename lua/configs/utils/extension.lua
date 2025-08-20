local M = {}

function M.find_files(path)
    require("snacks").picker.files({ cwd = path })
end

function M.live_grep(path)
    require("snacks").picker.grep({ dirs = { path } })
end

function M.vcs_status(path)
    require("neogit").open({ cwd = path })
end

function M.file_tree(path)
    require("neo-tree.command").execute({ toggle = true, dir = path })
end

function M.spectre_open(path)
    require("spectre").open({
        cwd = path,
    })
end

return M
