local Icons = require("configs.icons")

return {
    -- A formatter
    {
        "stevearc/conform.nvim",
        tag = "stable",
        event = { "BufWritePre" },
        cmd = { "ConformInfo" },
        config = function()
            local conform = require("conform")

            conform.formatters.prettier = {
                -- When cwd is not found, don't run the formatter (default false)
                require_cwd = true,
            }
            conform.formatters.biome = {
                require_cwd = true,
            }
            conform.formatters.stylua = {
                require_cwd = true,
            }
            conform.formatters.dprint = {
                require_cwd = true,
            }
            conform.formatters.djlint = {
                require_cwd = true,
            }
            conform.setup({
                format_on_save = function(_)
                    if vim.g.autoformat then
                        -- not recommended to change
                        return { timeout_ms = 3000, async = false, quiet = false, lsp_fallback = true }
                    end
                    return nil
                end,
                formatters_by_ft = {
                    lua = { "stylua" }, -- stylua trims trailing whitespace automatically
                    python = { "black" },

                    fish = { "fish_indent" },
                    sh = { "shfmt" },
                    just = { "just" },

                    javascript = { "prettier", "biome" },
                    typescript = { "prettier", "biome" },
                    vue = { "prettier", "biome" },
                    css = { "prettier", "biome" },
                    scss = { "prettier", "biome" },
                    html = { "prettier", "biome", "djlint" },
                    htmldjango = { "djlint", "rustywind" },
                    json = { "prettier", "biome", "dprint" },
                    jsonc = { "prettier", "biome", "dprint" },
                    graphql = { "prettier", "biome" },

                    yaml = { "prettier", "biome" },
                    markdown = { "dprint" },
                    dockerfile = { "dprint" },
                    toml = { "dprint" },
                    -- Can't use `[_]`. I always had trailing whitespace everywhre
                    -- Most of formatter ignore trailing whitespace entirely
                    ["*"] = { "trim_whitespace" },
                },
            })
        end,
    },
    -- A linter
    {
        "mfussenegger/nvim-lint",
        event = { "BufWritePost", "BufReadPost", "InsertLeave" },
        config = function()
            local lint = require("lint")

            lint.linters_by_ft = {
                lua = { "selene" },
                yaml = { "actionlint" },
                markdown = { "vale" },
                bash = { "shellcheck" },
                sh = { "shellcheck" },
                ["*"] = { "typos" },
            }
        end,
    },
    -- Find the the linter errors
    {
        "folke/trouble.nvim",
        tag = "stable",
        opts = { use_diagnostic_signs = true },
    },
    -- Displays vertical lines to indicate indentation levels.
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "VeryLazy",
        opts = {
            indent = {
                char = "│",
                tab_char = "│",
            },
            scope = { show_start = false, show_end = false },
            exclude = {
                filetypes = {
                    "help",
                    "alpha",
                    "dashboard",
                    "neo-tree",
                    "Trouble",
                    "trouble",
                    "lazy",
                    "mason",
                    "notify",
                    "toggleterm",
                    "lazyterm",
                },
            },
        },
        main = "ibl",
    },
    -- Color highlighter. à la Emacs rainbow-mode
    {
        "NvChad/nvim-colorizer.lua",
        event = { "BufWritePost", "BufReadPost", "InsertLeave" },
        config = function()
            require("colorizer").setup({})
        end,
    },
    -- Automatic pairing of brackets, quotes, etc.
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup({
                map_char = {
                    all = "(",
                    tex = "{",
                },
                enable_check_bracket_line = false,
                check_ts = true,
                ts_config = {
                    lua = { "string", "source" },
                    javascript = { "string", "template_string" },
                    java = false,
                },
                disable_filetype = { "TelescopePrompt", "spectre_panel" },
                ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]], "%s+", ""),
                enable_moveright = true,
                disable_in_macro = false,
                enable_afterquote = true,
                map_bs = true,
                map_c_w = false,
                disable_in_visualblock = false,
                fast_wrap = {
                    map = "<M-e>",
                    chars = { "{", "[", "(", '"', "'" },
                    pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
                    offset = 0, -- Offset from pattern match
                    end_key = "$",
                    keys = "qwertyuiopzxcvbnmasdfghjkl",
                    check_comma = true,
                    highlight = "Search",
                    highlight_grey = "Comment",
                },
            })
        end,
    },
    -- Show trailing whitespace
    {
        -- Using autocmd and hacky regex always match trailing whitespace
        -- during typing.
        "kaplanz/retrail.nvim",
        event = "VeryLazy",
        config = function()
            local retrail = require("retrail")

            retrail.setup({
                -- Enabled filetypes.
                filetype = {
                    -- Excluded filetype list. Overrides `include` list.
                    exclude = {
                        "toggleterm",
                        "neo-tree",
                        -- following are defaults that need to be added or they'll be overridden
                        "",
                        "alpha",
                        "checkhealth",
                        "diff",
                        "help",
                        "lspinfo",
                        "man",
                        "mason",
                        "TelescopePrompt",
                        "Trouble",
                        "WhichKey",
                    },
                },
                -- Trimming already handled by conform
                trim = {
                    -- Auto trim on BufWritePre
                    auto = false,
                },
            })
        end,
    },
    -- LSP servers package manager
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            {
                "williamboman/mason.nvim",
                tag = "stable",
            },
            {
                "WhoIsSethDaniel/mason-tool-installer.nvim",
            },
        },
        config = function()
            -- Get the package name here https://mason-registry.dev/registry/list
            local servers = {
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
                "html",
                "cssls",
                "ts_ls", -- TypeScript language server
                "jsonls", -- JSON language server
                "tailwindcss", -- Tailwind language server
                "svelte", -- Svelte language server
                -- Python
                "pyright", -- language server
            }

            require("mason").setup({
                ui = {
                    border = "rounded",
                },
            })
            require("mason-lspconfig").setup({
                ensure_installed = servers,
            })
            require("mason-tool-installer").setup({
                ensure_installed = {
                    -- Lua
                    "stylua", -- formatter
                    "luacheck", -- linter
                    -- Yaml
                    "actionlint", -- linter
                    -- Shell
                    "shfmt", -- formatter
                    -- Python
                    "black", -- formatter
                    -- FE
                    "prettier",
                    "biome", -- formatter
                    "eslint-lsp", -- linter
                    "stylelint", -- linter
                    "djlint", -- formatter, linter
                    "rustywind", -- formatter
                    -- Misc
                    "dprint", -- formatter
                    "cspell", -- spell checker
                    "openscad-lsp", -- CAD
                },
            })
        end,
    },
    -- Show symbols outline
    {
        "simrat39/symbols-outline.nvim",
        cmd = "SymbolsOutline",
        config = function()
            require("symbols-outline").setup()
        end,
        opts = {
            keymaps = {
                fold = "z",
                unfold = "Z",
            },
            lsp_blacklist = {},
            symbol_blacklist = {},
        },
    },
    -- Enhances commenting functionality.
    {
        "echasnovski/mini.comment",
        event = "VeryLazy",
        opts = {
            options = {
                custom_commentstring = function()
                    return require("ts_context_commentstring.internal").calculate_commentstring()
                        or vim.bo.commentstring
                end,
            },
        },
    },
    -- Treesitter support.
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPost", "BufNewFile" },
        build = ":TSUpdate",
        dependencies = {
            {
                "nvim-treesitter/nvim-treesitter-textobjects",
                event = "VeryLazy",
            },
        },
        ---@type TSConfig
        ---@diagnostic disable-next-line: missing-fields
        opts = {
            highlight = { enable = true },
            indent = { enable = true },
            ensure_installed = {
                "bash",
                "c",
                "css",
                "diff",
                "html",
                "hurl",
                "javascript",
                "jsdoc",
                "json",
                "jsonc",
                "lua",
                "luadoc",
                "luap",
                "markdown",
                "markdown_inline",
                "python",
                "query",
                "regex",
                "scss",
                "svelte",
                "toml",
                "tsx",
                "typescript",
                "vim",
                "vimdoc",
                "yaml",
            },
        },
        ---@param opts TSConfig
        config = function(_, opts)
            require("nvim-treesitter.install").compilers = { "clang", "gcc" }

            if type(opts.ensure_installed) == "table" then
                ---@type table<string, boolean>
                local added = {}
                opts.ensure_installed = vim.tbl_filter(function(lang)
                    if added[lang] then
                        return false
                    end
                    added[lang] = true
                    return true
                end, opts.ensure_installed)
            end
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
    -- LSP support.
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            {
                "folke/lazydev.nvim",
                tag = "stable",
                ft = "lua",
                opts = {},
            },
        },
        opts = {
            diagnostic = {
                signs = {
                    active = true,
                    values = {
                        { name = "DiagnosticSignError", text = Icons.diagnostics.Error },
                        { name = "DiagnosticSignWarn", text = Icons.diagnostics.Warning },
                        { name = "DiagnosticSignHint", text = Icons.diagnostics.Hint },
                        { name = "DiagnosticSignInfo", text = Icons.diagnostics.Information },
                    },
                },
                virtual_text = false,
                update_in_insert = false,
                underline = true,
                severity_sort = true,
                float = {
                    focusable = true,
                    style = "minimal",
                    border = "rounded",
                    source = "always",
                    header = "",
                    prefix = "",
                },
            },
            servers = {
                -- Lua
                lua_ls = {
                    -- mason = false, -- set to false if you don't want this server to be installed with mason
                    settings = {
                        Lua = {
                            workspace = {
                                checkThirdParty = false,
                            },
                            completion = {
                                callSnippet = "Replace",
                            },
                        },
                    },
                },
                -- Yaml
                yamlls = {},
                -- Rust
                rust_analyzer = {},
                -- Markdown
                marksman = {},
                -- FE
                html = {
                    filetypes = { "html", "htmldjango" },
                },
                cssls = {},
                jsonls = {},
                ts_ls = {},
                tailwindcss = {},
                -- Python
                pyright = {},
            },
        },
        config = function(_, opts)
            vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

            local servers = opts.servers
            local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
            local capabilities = vim.tbl_deep_extend(
                "force",
                {},
                vim.lsp.protocol.make_client_capabilities(),
                has_cmp and cmp_nvim_lsp.default_capabilities() or {},
                opts.capabilities or {}
            )

            for server, _ in pairs(servers) do
                local server_opts = vim.tbl_deep_extend("force", {
                    capabilities = vim.deepcopy(capabilities),
                }, servers[server] or {})

                require("lspconfig")[server].setup(server_opts)
            end
        end,
    },
    -- Automatically add closing tags for HTML and JSX
    {
        "windwp/nvim-ts-autotag",
        event = { "BufReadPre", "BufNewFile" },
        opts = {},
    },
    --  Completion plugin
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            {
                "hrsh7th/cmp-nvim-lsp",
                event = "InsertEnter",
            },
            {
                "hrsh7th/cmp-emoji",
                event = "InsertEnter",
            },
            {
                "hrsh7th/cmp-buffer",
                event = "InsertEnter",
            },
            {
                "hrsh7th/cmp-path",
                event = "InsertEnter",
            },
            {
                "hrsh7th/cmp-cmdline",
                event = "InsertEnter",
            },
            {
                "saadparwaiz1/cmp_luasnip",
                event = "InsertEnter",
            },
            {
                "L3MON4D3/LuaSnip",
                event = "InsertEnter",
                dependencies = {
                    "rafamadriz/friendly-snippets",
                },
            },
            {
                "hrsh7th/cmp-nvim-lua",
            },
        },
        config = function()
            vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })
            vim.api.nvim_set_hl(0, "CmpItemKindTabnine", { fg = "#CA42F0" })
            vim.api.nvim_set_hl(0, "CmpItemKindCrate", { fg = "#F64D00" })
            vim.api.nvim_set_hl(0, "CmpItemKindEmoji", { fg = "#FDE030" })

            local cmp = require("cmp")
            local luasnip = require("luasnip")
            require("luasnip/loaders/from_vscode").lazy_load()
            require("luasnip").filetype_extend("typescriptreact", { "html", "htmldjango" })

            local check_backspace = function()
                local col = vim.fn.col(".") - 1
                return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
            end

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body) -- For `luasnip` users.
                    end,
                },
                mapping = {
                    ["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
                    ["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
                    ["<Down>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
                    ["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),

                    ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
                    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),

                    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
                    ["<C-e>"] = cmp.mapping({
                        i = cmp.mapping.abort(),
                        c = cmp.mapping.close(),
                    }),
                    -- Accept currently selected item. If none selected, `select` first item.
                    -- Set `select` to `false` to only confirm explicitly selected items.
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),

                    -- selene: allow(if_same_then_else)
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expandable() then
                            luasnip.expand()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        elseif check_backspace() then
                            fallback()
                        else
                            fallback()
                        end
                    end, {
                        "i",
                        "s",
                    }),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, {
                        "i",
                        "s",
                    }),
                },
                formatting = {
                    fields = { "kind", "abbr", "menu" },
                    format = function(entry, vim_item)
                        vim_item.kind = Icons.kind[vim_item.kind]
                        vim_item.menu = ({
                            nvim_lsp = "",
                            nvim_lua = "",
                            luasnip = "",
                            buffer = "",
                            path = "",
                            emoji = "",
                        })[entry.source.name]
                        if entry.source.name == "copilot" then
                            vim_item.kind = Icons.git.Octoface
                            vim_item.kind_hl_group = "CmpItemKindCopilot"
                        end

                        if entry.source.name == "cmp_tabnine" then
                            vim_item.kind = Icons.misc.Robot
                            vim_item.kind_hl_group = "CmpItemKindTabnine"
                        end

                        if entry.source.name == "crates" then
                            vim_item.kind = Icons.misc.Package
                            vim_item.kind_hl_group = "CmpItemKindCrate"
                        end

                        if entry.source.name == "lab.quick_data" then
                            vim_item.kind = Icons.misc.CircuitBoard
                            vim_item.kind_hl_group = "CmpItemKindConstant"
                        end

                        if entry.source.name == "emoji" then
                            vim_item.kind = Icons.misc.Smiley
                            vim_item.kind_hl_group = "CmpItemKindEmoji"
                        end

                        return vim_item
                    end,
                },
                sources = {
                    { name = "copilot" },
                    {
                        name = "nvim_lsp",
                        entry_filter = function(entry, ctx)
                            local kind = require("cmp.types.lsp").CompletionItemKind[entry:get_kind()]
                            if kind == "Snippet" and ctx.prev_context.filetype == "java" then
                                return false
                            end

                            if ctx.prev_context.filetype == "markdown" then
                                return true
                            end

                            if kind == "Text" then
                                return false
                            end

                            return true
                        end,
                    },
                    { name = "luasnip" },
                    { name = "cmp_tabnine" },
                    { name = "nvim_lua" },
                    { name = "buffer" },
                    { name = "path" },
                    { name = "calc" },
                    { name = "emoji" },
                    { name = "treesitter" },
                    { name = "crates" },
                    { name = "tmux" },
                },
                confirm_opts = {
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = false,
                },
                window = {
                    completion = {
                        border = "rounded",
                        winhighlight = "Normal:Pmenu,CursorLine:PmenuSel,FloatBorder:FloatBorder,Search:None",
                        col_offset = -3,
                        side_padding = 1,
                        scrollbar = false,
                        scrolloff = 8,
                    },
                    documentation = {
                        border = "rounded",
                        winhighlight = "Normal:Pmenu,FloatBorder:FloatBorder,Search:None",
                    },
                },
                experimental = {
                    ghost_text = false,
                },
            })

            pcall(function()
                local function on_confirm_done(...)
                    require("nvim-autopairs.completion.cmp").on_confirm_done()(...)
                end
                require("cmp").event:off("confirm_done", on_confirm_done)
                require("cmp").event:on("confirm_done", on_confirm_done)
            end)
        end,
    },
    -- Show 💡 for available code-action in current line
    {
        "kosayoda/nvim-lightbulb",
        config = function()
            require("nvim-lightbulb").setup({
                autocmd = { enabled = true },
            })
        end,
    },
    {
        "aznhe21/actions-preview.nvim",
    },
}
