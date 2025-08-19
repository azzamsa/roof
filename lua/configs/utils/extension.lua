local M = {}

function M.find_files(path)
    Snacks.picker.files({ cwd = path })
end

function M.grep(path)
    Snacks.picker.grep({ dirs = { path } })
end

function M.terminal(path)
    Snacks.terminal.toggle("fish", {
        direction = "float", -- optional, setting cmd means float anyway
        cwd = path,
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
