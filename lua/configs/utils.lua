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
function M.sanitize(path)
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
---@param path string
function M.project_root(path)
    local root = vim.fn.system("toor " .. path .. " 2>/dev/null")
    root = vim.fn.trim(root)

    if root == "" then
        return nil
    end

    return root
end

-- Live grep from current buffer directory
function M.grep_from_here()
    M.live_grep(vim.fn.expand("%:p:h"))
end

-- Live grep from the project root.
function M.grep_in_project()
    local root = M.project_root(vim.fn.expand("%:p:h"))
    -- Use the current file's directory if the project root is empty
    if root == "" then
        root = vim.fn.expand("%:p:h")
    end

    M.live_grep(root)
end

-- Find files from the directory of `config`
function M.find_files_in_config()
    M.find_files(vim.fn.stdpath("config"))
end

-- Find files from the directory of the currently opened buffer.
function M.find_files_from_here()
    M.find_files(vim.fn.expand("%:p:h"))
end

-- Find files from the project root.
function M.find_files_in_project()
    local root = M.project_root(vim.fn.expand("%:p:h"))
    -- Use the current file's directory if the project root is empty
    if root == "" then
        root = vim.fn.expand("%:p:h")
    end

    M.find_files(root)
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

--
-- Formatters and Linters
--

--- Get full config path located in custom directory.
--- Usually it is on the root directory.
---@param filename string
function M.config_path(filename)
    local root = M.project_root(vim.fn.expand("%:p:h"))
    local path = vim.fs.find(filename, { path = root })[1]
    if path then
        return path
    end
end

return M
