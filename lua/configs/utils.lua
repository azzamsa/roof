local M = {}

-- Find files from the directory of `config`
function M.find_files_in_config()
    require("telescope.builtin").find_files({
        cwd = vim.fn.stdpath("config"),
    })
end

-- Find files from the directory of the currently opened buffer.
function M.find_files_from_here()
    local current_buffer_dir = vim.fn.expand("%:p:h")
    require("telescope.builtin").find_files({
        cwd = current_buffer_dir,
    })
end

function M.toggle_opt(option)
    vim.opt_local[option] = not vim.opt_local[option]:get()
    local status = vim.opt_local[option]:get() and "Enabled" or "Disabled"
    -- Util.info(status .. " " .. option, { title = "Option" })
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

---@param buf? number
function M.format_enabled(buf)
    buf = (buf == nil or buf == 0) and vim.api.nvim_get_current_buf() or buf
    local gaf = vim.g.autoformat
    local baf = vim.b[buf].autoformat

    -- If the buffer has a local value, use that
    if baf ~= nil then
        return baf
    end

    -- Otherwise use the global value if set, or true by default
    return gaf == nil or gaf
end

---@param buf? boolean
function M.toggle_format(buf)
    if buf then
        vim.b.autoformat = not M.format_enabled()
    else
        vim.g.autoformat = not M.format_enabled()
        vim.b.autoformat = nil
    end
    M.info()
end

function M.grep_from_here()
    local current_buffer_dir = vim.fn.expand("%:p:h")
    require("telescope.builtin").live_grep({
        cwd = current_buffer_dir,
    })
end

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
