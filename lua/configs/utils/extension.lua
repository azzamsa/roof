local M = {}

function M.find_files(path)
    require("telescope.builtin").find_files({
        cwd = path,
        -- Show hidden files by default. Most of them are important in my case.
        -- Things like `dotfiles/.configs/*` are crucial.
        -- I can put uninteresting files under `.ignore` if I wish.
        hidden = true,
    })
end

function M.live_grep(path)
    require("telescope.builtin").live_grep({
        cwd = path,
    })
end

function M.neogit_open(path)
    require("neogit").open({ cwd = path })
end

function M.neotree_open(path)
    require("neo-tree.command").execute({ toggle = true, dir = path })
end

return M
