local M = {
    "akinsho/toggleterm.nvim",
    event = "VeryLazy",
    commit = "c80844fd52ba76f48fabf83e2b9f9b93273f418d",
}

function M.config()
    local function get_previous_buffer_path()
        local previous_bufnr = vim.fn.bufnr("#")
        -- So far, there must be a previous buffer.
        -- No need to check if there is a previous buffer `previous_bufnr ~= -1`.
        return vim.fn.fnamemodify(vim.fn.bufname(previous_bufnr), ":p:h")
    end

    require("toggleterm").setup({
        open_mapping = [[<c-/>]],
        direction = "float",
        close_on_exit = true, -- close the terminal window when the process exits
        -- Already set in "opt.shell"
        shell = vim.o.shell, -- change the default shell
        float_opts = {
            border = "rounded",
        },

        -- Runs everytime ToggleTerm toggled
        on_open = function(term)
            -- Can't use `require("configs.utils").file_path()` because it uses ToggleTerm buffer
            -- instead of the currently opened buffer.
            -- A helper function is needed to get previous buffer path.
            --
            -- Sometimes, I want to open the terminal in a non-project directory.
            local path = get_previous_buffer_path()
            -- Open from oily path too! Such as `oil.nvim`
            path = require("configs.utils").validate_path(path)

            -- Use project root if available, otherwise use the plain path.
            path = require("configs.utils").project_root_or_cwd(path)
            if path ~= term.dir then
                term:change_dir(path)
            end

            -- Start in insert mode
            vim.cmd("startinsert!")
        end,
    })
end

return M
