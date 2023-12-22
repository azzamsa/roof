local M = {
    "akinsho/toggleterm.nvim",
    event = "VeryLazy",
    commit = "c80844fd52ba76f48fabf83e2b9f9b93273f418d",
}

function M.config()
    local function get_previous_buffer_path()
        local previous_bufnr = vim.fn.bufnr("#")

        -- Check if there is a previous buffer
        if previous_bufnr ~= -1 then
            return vim.fn.fnamemodify(vim.fn.bufname(previous_bufnr), ":p:h")
        else
            return nil
        end
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
            -- Can't use `vim.fn.expand("%:p:h")` because it uses ToggleTerm buffer
            -- instead of the currently opened buffer.
            -- A helper function is needed to get previous buffer path

            -- Sometimes, I want to open the terminal in a non-project directory.
            -- In such cases, I use the plain buffer path instead of '.project_root(get_previous_buffer_path())'.
            -- If I later decide to switch to the project root, I can simply type 'r' (toor) in the floating terminal.
            local cwd = get_previous_buffer_path()
            if not cwd then
                cwd = vim.fn.getcwd()
            end

            if cwd ~= term.dir then
                term:change_dir(cwd)
            end

            -- Start in insert mode
            vim.cmd("startinsert!")
        end,
    })
end

return M
