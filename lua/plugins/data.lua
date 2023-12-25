return {
    {
        "imsnif/kdl.vim",
        event = "VeryLazy",
        commit = "b84d7d3a15d8d30da016cf9e98e2cfbe35cddee5",
    },
    {
        -- The `IndianBoy42/tree-sitter-just` plugin doesn't reliably
        -- highlight Justfiles. Instead, I use `vim-just`.
        "NoahTheDuke/vim-just",
        event = "VeryLazy",
        commit = "cbba24e544dd32509a6b68271ce3142ab5a180c3",
        ft = { "just" },
    },
    {
        "iamcco/markdown-preview.nvim",
        commit = "a923f5fc5ba36a3b17e289dc35dc17f66d0548ee",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = function()
            vim.fn["mkdp#util#install"]()
        end,
        config = function()
            vim.cmd([[do FileType]])
        end,
    },
}
