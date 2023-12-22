local M = {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    commit = "d496c5e08e853dadedc7f5d0a6541288d0441fd3",
    build = ":TSUpdate",
    dependencies = {
        {
            "nvim-treesitter/nvim-treesitter-textobjects",
            event = "VeryLazy",
            commit = "ec1c5bdb3d87ac971749fa6c7dbc2b14884f1f6a",
        },
        {
            "JoosepAlviste/nvim-ts-context-commentstring",
            event = "VeryLazy",
            commit = "1277b4a1f451b0f18c0790e1a7f12e1e5fdebfee",
        },
        {
            "windwp/nvim-ts-autotag",
            event = "VeryLazy",
            commit = "8515e48a277a2f4947d91004d9aa92c29fdc5e18",
        },
        {
            "windwp/nvim-autopairs",
            event = "InsertEnter",
            commit = "9fd41181693dd4106b3e414a822bb6569924de81",
        },
    },
}
function M.config()
    require("ts_context_commentstring").setup({
        ensure_installed = { "lua", "markdown", "markdown_inline", "bash", "python" }, -- put the language you want in this array
        ignore_install = { "" },
        sync_install = false,
        highlight = {
            enable = true,
            disable = { "markdown" },
            additional_vim_regex_highlighting = false,
        },

        indent = { enable = true },

        matchup = {
            enable = { "astro" },
            disable = { "lua" },
        },

        autotag = { enable = true },

        context_commentstring = {
            enable = true,
            enable_autocmd = false,
        },

        autopairs = { enable = true },

        textobjects = {
            select = {
                enable = true,
                -- Automatically jump forward to textobj, similar to targets.vim
                lookahead = true,
                keymaps = {
                    -- You can use the capture groups defined in textobjects.scm
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",
                    ["at"] = "@class.outer",
                    ["it"] = "@class.inner",
                    ["ac"] = "@call.outer",
                    ["ic"] = "@call.inner",
                    ["aa"] = "@parameter.outer",
                    ["ia"] = "@parameter.inner",
                    ["al"] = "@loop.outer",
                    ["il"] = "@loop.inner",
                    ["ai"] = "@conditional.outer",
                    ["ii"] = "@conditional.inner",
                    ["a/"] = "@comment.outer",
                    ["i/"] = "@comment.inner",
                    ["ab"] = "@block.outer",
                    ["ib"] = "@block.inner",
                    ["as"] = "@statement.outer",
                    ["is"] = "@scopename.inner",
                    ["aA"] = "@attribute.outer",
                    ["iA"] = "@attribute.inner",
                    ["aF"] = "@frame.outer",
                    ["iF"] = "@frame.inner",
                },
            },
        },
    })

    -- local configs = require "nvim-treesitter.configs"
    --
    -- configs.setup {
    --   -- modules = {
    --   --
    --   --
    --   --   rainbow = {
    --   --     enable = false,
    --   --     query = {
    --   --       "rainbow-parens",
    --   --     },
    --   --     strategy = require("ts-rainbow").strategy.global,
    --   --     hlgroups = {
    --   --       -- "TSRainbowRed",
    --   --       "TSRainbowBlue",
    --   --       -- "TSRainbowOrange",
    --   --       -- "TSRainbowCoral",
    --   --       "TSRainbowPink",
    --   --       "TSRainbowYellow",
    --   --       -- "TSRainbowViolet",
    --   --       -- "TSRainbowGreen",
    --   --     },
    --   --   },
    --   -- },
    -- }
end

return M
