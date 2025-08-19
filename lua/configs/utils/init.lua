local M = {}
local Ext = require("configs.utils.extension")
local Path = require("configs.utils.path")

-- Open `target` with default app
function M.open_with(target)
    target = Path.sanitize(target)
    vim.fn.system("xdg-open " .. target)
end

-- Live grep from current buffer directory
function M.grep_from_here()
    local here = Path.sanitize(Path.current_dir())
    Ext.grep(here)
end

-- Live grep from the project root.
function M.grep_in_project()
    local path = Path.sanitize(Path.current_dir())
    Ext.grep(Path.project_root_or_cwd(path))
end

-- Find files from the directory of `config`
function M.find_files_in_config()
    Ext.find_files(vim.fn.stdpath("config"))
end

-- Find files from the directory of the currently opened buffer.
-- Can't use something like `{ filter = { cwd = true }` here.
-- As my `cwd` always points to `$HOME`, because I use nvim similar to Emacs workflow.
-- I don't do `nvim .` in terminal, but one long lived Neovide instance.
function M.find_files_from_here()
    local here = Path.sanitize(Path.current_dir())
    Ext.find_files(here)
end

-- Find files from the project root.
function M.find_files_in_project()
    local path = Path.sanitize(Path.current_dir())
    path = Path.project_root_or_cwd(path)
    Ext.find_files(path)
end

-- Open projects
function M.projects()
    Ext.projects()
end

-- I choose to name this function 'ngit' so that I won't need to alter the function name
-- regardless of the extension changes.
function M.ngit_here()
    -- Simply using `("neogit").open()` doesn't work within the Oil directory.
    -- The `Path.validate()` function serves as a helper to provide a valid path based on the Oil path.
    local path = Path.sanitize(Path.current_dir())

    -- it must be from VCS root!
    -- Override other project root marks such as `.projectile`
    local pattern = ".git"

    -- ⚠️ Neogit must be executed from root directory!
    --
    -- While using the directory path functions correctly for Git commit and Git status,
    -- it encounters issues during hunk and file visit operations. For these operations,
    -- `Neogit` necessitates functioning from the `.git` (root) directory.
    local root = Path.project_root(path, pattern)
    if root then
        Ext.neogit_open(root)
    else
        vim.notify("No .git directory found. \nPlease initialize a Git repository.", "warn", { title = "Roof!" })
    end
end

-- Open neotree
function M.ntree_here()
    local path = Path.sanitize(Path.current_dir())
    path = Path.project_root_or_cwd(path)
    Ext.neotree_open(path)
end

-- Spectre from here
function M.spectre_here()
    local path = Path.sanitize(Path.current_dir())
    path = Path.project_root_or_cwd(path)
    Ext.spectre_open(path)
end

-- Spectre from here
function M.teminal_here()
    local path = Path.sanitize(Path.current_dir())
    path = Path.project_root_or_cwd(path)
    Ext.terminal(path)
end

-- Copy filename to clipboard
function M.copy_filename_to_clipboard()
    local path = Path.filename()
    vim.fn.setreg("+", path)
    vim.notify(path, vim.log.levels.INFO, { title = "Copied" })
end

-- Copy path to to_clipboard
function M.copy_filepath_to_clipboard()
    local path = Path.abs_path()
    vim.fn.setreg("+", path)
    vim.notify(path, vim.log.levels.INFO, { title = "Copied" })
end

--
-- Toggle
--

function M.toggle_autoformat()
    vim.g.autoformat = not vim.g.autoformat
    if vim.g.autoformat then
        vim.g.autoformat = true
        vim.notify("Enabled autoformat")
    else
        vim.g.autoformat = false
        vim.notify("Disabled autoformat")
    end
end

return M
