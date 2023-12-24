local M = {
    "williamboman/mason-lspconfig.nvim",
    commit = "e7b64c11035aa924f87385b72145e0ccf68a7e0a",
    dependencies = {
        {
            "williamboman/mason.nvim",
            commit = "41e75af1f578e55ba050c863587cffde3556ffa6",
        },
        {
            "WhoIsSethDaniel/mason-tool-installer.nvim",
            commit = "8b70e7f1e0a4119c1234c3bde4a01c241cabcc74",
        },
    },
}

-- Get the package name here https://mason-registry.dev/registry/list
M.servers = {
    -- Lua
    "lua_ls", -- language server

    -- Rust
    "rust_analyzer", -- language server

    -- Yaml
    "yamlls", -- language server

    -- Markdown
    "marksman", -- Markdown language server

    -- Shell
    "bashls", -- language server

    -- FE
    "tsserver", -- TypeScript language server
    "jsonls", -- JSON language server
    "tailwindcss", -- Tailwind language server

    -- Python
    "pyright", -- language server
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
    require("mason-tool-installer").setup({
        ensure_installed = {
            -- Lua
            "stylua", -- formatter
            "luacheck", -- linter

            -- Yaml
            "actionlint", -- linter

            -- Shell
            "shfmt", -- formatting

            -- FE
            "prettier", -- formatter
            "eslint-lsp", -- linter
            "stylelint", -- linter

            -- Misc
            "cspell", -- spell checker
        },
    })
end

return M
