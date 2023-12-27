local M = {}

-- Get real path
---@param path string
function M.validate(path)
    local is_oil_path = string.match(path, "^oil://")

    if is_oil_path then
        -- Remove the "oil://" prefix
        return string.gsub(path, "^oil://", "")
    else
        return path
    end
end

-- Get current file path
function M.path()
    local path = vim.fn.expand("%:p")
    return M.validate(path)
end

function M.copy_path()
    local path = M.path()
    vim.fn.setreg("+", path)
    vim.notify(path, vim.log.levels.INFO, { title = "Copied" })
end

function M.copy_name()
    local path = M.path()
    vim.fn.setreg("+", path)
    vim.notify(path, vim.log.levels.INFO, { title = "Copied" })
end

return M
