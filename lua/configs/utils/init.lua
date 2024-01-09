local M = {}
local Ext = require("configs.utils.extension")
local Path = require("configs.utils.path")

-- Open `target` with default app
function M.open_with(target)
    vim.fn.system("xdg-open " .. target)
end

-- Live grep from current buffer directory
function M.grep_from_here()
    local here = Path.validate(Path.current_dir())
    Ext.live_grep(here)
end

-- Live grep from the project root.
function M.grep_in_project()
    local path = Path.validate(Path.current_dir())
    Ext.live_grep(Path.project_root_or_cwd(path))
end

-- Find files from the directory of `config`
function M.find_files_in_config()
    Ext.find_files(vim.fn.stdpath("config"))
end

-- Find files from the directory of the currently opened buffer.
function M.find_files_from_here()
    local here = Path.validate(Path.current_dir())
    Ext.find_files(here)
end

-- Find files from the project root.
function M.find_files_in_project()
    local path = Path.validate(Path.current_dir())
    path = Path.project_root_or_cwd(path)
    Ext.find_files(path)
end

-- I choose to name this function 'ngit' so that I won't need to alter the function name
-- regardless of the extension changes.
function M.ngit_here()
    -- Simply using `("neogit").open()` doesn't work within the Oil directory.
    -- The `Path.validate()` function serves as a helper to provide a valid path based on the Oil path.
    local path = Path.validate(Path.current_dir())

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
    local path = Path.validate(Path.current_dir())
    path = Path.project_root_or_cwd(path)
    Ext.neotree_open(path)
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

function M.toggle_opt(option)
    vim.opt_local[option] = not vim.opt_local[option]:get()
    local status = vim.opt_local[option]:get() and "Enabled" or "Disabled"
    vim.notify(status .. " " .. option, "info")
end

local nu = { number = true, relativenumber = true }
function M.toggle_line_number()
    if vim.opt_local.number:get() or vim.opt_local.relativenumber:get() then
        nu = { number = vim.opt_local.number:get(), relativenumber = vim.opt_local.relativenumber:get() }
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
        vim.notify("Disabled line numbers", "info")
    else
        vim.opt_local.number = nu.number
        vim.opt_local.relativenumber = nu.relativenumber
        vim.notify("Enabled line numbers", "info")
    end
end

local diagnostic_enabled = true
function M.toggle_diagnostics()
    diagnostic_enabled = not diagnostic_enabled
    if diagnostic_enabled then
        vim.diagnostic.enable()
        vim.notify("Enabled diagnostics", "info")
    else
        vim.diagnostic.disable()
        vim.notify("Disabled diagnostics", "info")
    end
end

function M.toggle_inlay_hints(buf, value)
    local ih = vim.lsp.buf.inlay_hint or vim.lsp.inlay_hint
    if type(ih) == "function" then
        ih(buf, value)
    elseif type(ih) == "table" and ih.enable then
        if value == nil then
            value = not ih.is_enabled(buf)
        end
        ih.enable(buf, value)
    end
end

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

--
-- scratch
--

local scratch_file = "~/.local/share/meta/**scratch**.md"

-- Toggle the scratch buffer.
function M.toggle_scratch_buffer()
    for _, win in ipairs(vim.fn.getwininfo()) do
        local buf_name = vim.fn.bufname(win.bufnr)
        -- Close scratch buffer if it is currently open
        if string.find(buf_name, "**scratch**") then
            vim.cmd(win.winnr .. "wincmd w")
            vim.cmd("bd! " .. win.bufnr)
            return
        end
    end

    vim.cmd("vsplit " .. scratch_file)
end

return M
