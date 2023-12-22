local M = {
    "williamboman/mason-lspconfig.nvim",
    commit = "e7b64c11035aa924f87385b72145e0ccf68a7e0a",
    dependencies = {
        {
            "williamboman/mason.nvim",
            commit = "41e75af1f578e55ba050c863587cffde3556ffa6",
        },
        {
            "nvim-lua/plenary.nvim",
            commit = "55d9fe89e33efd26f532ef20223e5f9430c8b0c0",
        },
    },
}

-- Get the package name here https://mason-registry.dev/registry/list
M.servers = {
    -- Lua
    "lua-language-server", -- language server
    "stylua", -- formatter
    "luacheck", -- linter

    -- Rust
    "rust-analyzer", -- language server

    -- Yaml
    "yamlls", -- language server
    "actionlint", -- linter

    -- Markdown
    "marksman", -- Markdown language server

    -- Shell
    "bash-language-server", -- language server
    "shfmt", -- formatting

    -- FE
    "typescript-language-server", -- TypeScript language server
    "css-lsp", -- CSS language server
    "json-lsp", -- JSON language server
    "tailwindcss-language-server", -- Tailwind language server
    "prettier", -- formatter
    "eslint-lsp", -- linter
    "stylelint", -- linter

    -- Python
    "pyright", -- language server

    -- Misc
    "cspell", -- spell checker
}

function M.config()
    require("mason").setup({
        ui = {
            border = "rounded",
        },
    })
    require("mason-lspconfig").setup({
        ensure_installed = M.servers,
    })
end

return M
