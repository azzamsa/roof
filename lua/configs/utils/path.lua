local M = {}

-- Get current working directory
function M.current_dir()
    -- Get current working directory from buffer location
    local current_dir = vim.fn.expand("%:p:h")
    return current_dir
end

-- Get previous working directory
function M.previous_dir()
    local previous_bufnr = vim.fn.bufnr(0)
    -- Ensure there is a previous buffer
    if previous_bufnr ~= -1 then
        local path = vim.fn.fnamemodify(vim.fn.bufname(previous_bufnr), ":p:h")
        return path
    else
        return nil
    end
end

-- Get absolute path of current file
function M.abs_path()
    local path = vim.fn.expand("%:p")
    return path
end

-- Get a name of the current file
function M.filename()
    local path = vim.fn.expand("%:t")
    return path
end

-- Get a valid PATH for `cd` argument
-- Remove any app previxes such as `oil://`
---@param path string
function M.sanitize(path)
    -- Is this `Oil` path?
    local is_oil_path = string.match(path, "^oil://")
    if is_oil_path then
        -- Remove the "oil://" prefix
        path = string.gsub(path, "^oil://", "")
    end

    -- Is the path contains whitespace?
    -- local is_contains_whitespace = string.find(path, "%s")
    local is_contains_whitespace = string.find(path, "%s") ~= nil
    if is_contains_whitespace then
        -- Escape spaces in the path
        path = vim.fn.shellescape(path)
    end

    return path
end

-- Find project root
-- Requires https://github.com/azzamsa/toor
---@param path string
---@param pattern? string
function M.project_root(path, pattern)
    local command = "toor " .. path
    if pattern then
        command = command .. " --roots " .. pattern
    end

    local root = vim.fn.system(command .. " 2>/dev/null")
    root = vim.fn.trim(root)

    if root == "" then
        return nil
    end

    return root
end

-- Try to get project root. If fails fallback to cwd.
---@param path string
function M.project_root_or_cwd(path)
    local root = M.project_root(path)
    if root then
        path = root
    end

    return path
end

return M
