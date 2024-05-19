return {
    {
        "imsnif/kdl.vim",
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
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = function()
            vim.fn["mkdp#util#install"]()
        end,
        config = function()
            vim.cmd([[do FileType]])
        end,
    },
    {
        "kaarmu/typst.vim",
        event = "VeryLazy",
        ft = "typst",
    },
}
