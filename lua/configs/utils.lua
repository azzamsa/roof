local M = {}

function M.find_files(path)
    require("telescope.builtin").find_files({
        cwd = path,
    })
end

function M.live_grep(path)
    require("telescope.builtin").live_grep({
        cwd = path,
    })
end

-- Get real path
---@param path string
function M.validate_path(path)
    local is_oil_path = string.match(path, "^oil://")

    if is_oil_path then
        -- Remove the "oil://" prefix
        return string.gsub(path, "^oil://", "")
    else
        return path
    end
end

-- Find project root
-- Requires https://github.com/azzamsa/toor
---@param path? string
function M.project_root(path)
    if path then
        path = M.validate_path(path)
    end

    if not path then
        path = M.cwd()
    end

    local root = vim.fn.system("toor " .. path .. " 2>/dev/null")
    root = vim.fn.trim(root)

    if root == "" then
        return
    end

    return root
end

-- Find current working directory
function M.cwd()
    local dir_buffer = vim.fn.expand("%:p:h")
    return M.validate_path(dir_buffer)
end

-- Try to get project root. If fails fallback to cwd.
function M.project_root_or_cwd()
    local cwd = M.cwd()
    local path = M.project_root(cwd)
    -- Use the current file's directory if the project root is empty
    if not path then
        path = cwd
    end

    return path
end

-- Live grep from current buffer directory
function M.grep_from_here()
    M.live_grep(M.cwd())
end

-- Live grep from the project root.
function M.grep_in_project()
    M.live_grep(M.project_root_or_cwd())
end

-- Find files from the directory of `config`
function M.find_files_in_config()
    M.find_files(M.cwd())
end

-- Find files from the directory of the currently opened buffer.
function M.find_files_from_here()
    M.find_files(M.cwd())
end

-- Find files from the project root.
function M.find_files_in_project()
    M.find_files(M.project_root_or_cwd())
end

--
-- Formatters and Linters
--

--- Get full config path located in custom directory.
--- Mostly the config for sormatters and linters.
-- Such as `configs/dprint.json`, `configs/stylua.toml`
---@param filename string
function M.config_path(filename)
    local root = M.project_root()
    local path = vim.fs.find(filename, { path = root })[1]
    if path then
        return path
    end
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
function M.open_scratch_buffer()
    for _, win in ipairs(vim.fn.getwininfo()) do
        if vim.fn.bufname(win.bufnr) == scratch_file then
            vim.cmd(win.winnr .. "wincmd w")
            return
        end
    end

    vim.cmd("vsplit " .. scratch_file)
end

return M
