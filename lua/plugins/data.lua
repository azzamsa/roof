return {
    {
        "imsnif/kdl.vim",
        event = "VeryLazy",
    },
    {
        "ron-rs/ron.vim",
        event = "VeryLazy",
    },
    {
        -- The `IndianBoy42/tree-sitter-just` plugin doesn't reliably
        -- highlight Justfiles. Instead, I use `vim-just`.
        "NoahTheDuke/vim-just",
        event = "VeryLazy",
        ft = { "just" },
    },
    {
        "kaarmu/typst.vim",
        event = "VeryLazy",
        ft = "typst",
    },
    {
        "jellydn/hurl.nvim",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        ft = "hurl",
        opts = {
            -- Default formatter
            formatters = {
                json = { "jq" }, -- Make sure you have install jq in your system, e.g: brew install jq
                html = {
                    "prettier", -- Make sure you have install prettier in your system, e.g: npm install -g prettier
                    "--parser",
                    "html",
                },
            },
        },
    },
}
