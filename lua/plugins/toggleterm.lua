local M = {
    "akinsho/toggleterm.nvim",
    event = "VeryLazy",
    commit = "c80844fd52ba76f48fabf83e2b9f9b93273f418d",
}

function M.config()
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
            local cwd = vim.fn.getcwd()
            if cwd ~= term.dir then
                vim.notify("Term directory updaed")
                term:change_dir(cwd)
            end
        end,
    })
end

return M
