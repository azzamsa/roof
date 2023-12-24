local M = {
    "folke/noice.nvim",
    event = "VeryLazy",
    commit = "92433164e2f7118d4122c7674c3834d9511722ba",
    dependencies = {
        {
            "rcarriga/nvim-notify",
            event = "VeryLazy",
            commit = "e4a2022f4fec2d5ebc79afa612f96d8b11c627b3",
            config = function()
                require("notify").setup({
                    render = "simple",
                    -- FIXME: timeout didn't get applied but render did.
                    timeout = 1000,
                    on_open = function(win)
                        vim.api.nvim_win_set_config(win, { focusable = false })
                    end,
                })
            end,
        },
    },
}

function M.config()
    require("noice").setup({
        lsp = {
            -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
                ["cmp.entry.get_documentation"] = true,
            },
        },
        -- you can enable a preset for easier configuration
        presets = {
            bottom_search = true, -- use a classic bottom cmdline for search
            command_palette = true, -- position the cmdline and popupmenu together
            long_message_to_split = true, -- long messages will be sent to a split
            inc_rename = false, -- enables an input dialog for inc-rename.nvim
            lsp_doc_border = false, -- add a border to hover docs and signature help
        },
    })
end

return M
