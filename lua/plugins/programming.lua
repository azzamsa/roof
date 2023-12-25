return {
    -- Treesitter support.
    {
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
        config = function()
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
        end,
    },
    -- LSP support.
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        commit = "e49b1e90c1781ce372013de3fa93a91ea29fc34a",
        dependencies = {
            {
                "folke/neodev.nvim",
                commit = "b094a663ccb71733543d8254b988e6bebdbdaca4",
            },
        },
        config = function()
            local function common_capabilities()
                local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
                if status_ok then
                    return cmp_nvim_lsp.default_capabilities()
                end

                local capabilities = vim.lsp.protocol.make_client_capabilities()
                capabilities.textDocument.completion.completionItem.snippetSupport = true
                capabilities.textDocument.completion.completionItem.resolveSupport = {
                    properties = {
                        "documentation",
                        "detail",
                        "additionalTextEdits",
                    },
                }

                return capabilities
            end

            local lspconfig = require("lspconfig")
            local icons = require("configs.icons")

            local servers = {
                -- Lua
                "lua_ls",

                -- Yaml
                "yamlls",

                -- Rust
                "rust_analyzer",

                -- Markdown
                "marksman",

                -- FE
                "jsonls",
                "tsserver",
                "tailwindcss",

                -- Python
                "pyright",
            }

            local default_diagnostic_config = {
                signs = {
                    active = true,
                    values = {
                        { name = "DiagnosticSignError", text = icons.diagnostics.Error },
                        { name = "DiagnosticSignWarn", text = icons.diagnostics.Warning },
                        { name = "DiagnosticSignHint", text = icons.diagnostics.Hint },
                        { name = "DiagnosticSignInfo", text = icons.diagnostics.Information },
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
            }

            vim.diagnostic.config(default_diagnostic_config)

            for _, sign in ipairs(vim.tbl_get(vim.diagnostic.config(), "signs", "values") or {}) do
                vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
            end

            vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
            vim.lsp.handlers["textDocument/signatureHelp"] =
                vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
            require("lspconfig.ui.windows").default_options.border = "rounded"

            for _, server in pairs(servers) do
                local opts = {
                    capabilities = common_capabilities(),
                }

                local require_ok, settings = pcall(require, "plugins.lspsettings." .. server)
                if require_ok then
                    opts = vim.tbl_deep_extend("force", settings, opts)
                end

                if server == "lua_ls" then
                    require("neodev").setup({})
                end

                lspconfig[server].setup(opts)
            end
        end,
    },
    --  Completion plugin
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        commit = "d3a3056204e1a9dbb7c7fe36c114dc43b681768c",
        dependencies = {
            {
                "hrsh7th/cmp-nvim-lsp",
                event = "InsertEnter",
                commit = "44b16d11215dce86f253ce0c30949813c0a90765",
            },
            {
                "hrsh7th/cmp-emoji",
                event = "InsertEnter",
                commit = "19075c36d5820253d32e2478b6aaf3734aeaafa0",
            },
            {
                "hrsh7th/cmp-buffer",
                event = "InsertEnter",
                commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa",
            },
            {
                "hrsh7th/cmp-path",
                event = "InsertEnter",
                commit = "91ff86cd9c29299a64f968ebb45846c485725f23",
            },
            {
                "hrsh7th/cmp-cmdline",
                event = "InsertEnter",
                commit = "8ee981b4a91f536f52add291594e89fb6645e451",
            },
            {
                "saadparwaiz1/cmp_luasnip",
                event = "InsertEnter",
                commit = "05a9ab28b53f71d1aece421ef32fee2cb857a843",
            },
            {
                "L3MON4D3/LuaSnip",
                event = "InsertEnter",
                commit = "80a8528f084a97b624ae443a6f50ff8074ba486b",
                dependencies = {
                    "rafamadriz/friendly-snippets",
                },
            },
            {
                "hrsh7th/cmp-nvim-lua",
                commit = "f12408bdb54c39c23e67cab726264c10db33ada8",
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
            require("luasnip").filetype_extend("typescriptreact", { "html" })

            local check_backspace = function()
                local col = vim.fn.col(".") - 1
                return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
            end

            local icons = require("configs.icons")

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
                        vim_item.kind = icons.kind[vim_item.kind]
                        vim_item.menu = ({
                            nvim_lsp = "",
                            nvim_lua = "",
                            luasnip = "",
                            buffer = "",
                            path = "",
                            emoji = "",
                        })[entry.source.name]
                        if entry.source.name == "copilot" then
                            vim_item.kind = icons.git.Octoface
                            vim_item.kind_hl_group = "CmpItemKindCopilot"
                        end

                        if entry.source.name == "cmp_tabnine" then
                            vim_item.kind = icons.misc.Robot
                            vim_item.kind_hl_group = "CmpItemKindTabnine"
                        end

                        if entry.source.name == "crates" then
                            vim_item.kind = icons.misc.Package
                            vim_item.kind_hl_group = "CmpItemKindCrate"
                        end

                        if entry.source.name == "lab.quick_data" then
                            vim_item.kind = icons.misc.CircuitBoard
                            vim_item.kind_hl_group = "CmpItemKindConstant"
                        end

                        if entry.source.name == "emoji" then
                            vim_item.kind = icons.misc.Smiley
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
    -- A formatter
    {
        "stevearc/conform.nvim",
        commit = "8b407bb6175846cdc4c499e2a8d28109615a2089",
        event = { "BufWritePre" },
        cmd = { "ConformInfo" },
        config = function()
            local conform = require("conform")

            conform.formatters.stylua = {
                prepend_args = function()
                    local config = require("configs.utils").config_path("stylua.toml")
                    if config then
                        return { "--config-path", config }
                    end
                end,
                -- Don't run in case `stylua.toml` doesn't exist
                condition = function()
                    return require("configs.utils").config_path("stylua.toml")
                end,
            }

            conform.setup({
                format_on_save = function(_)
                    if vim.g.autoformat then
                        -- not recommended to change
                        return { timeout_ms = 3000, async = false, quiet = false }
                    end
                    return
                end,
                formatters_by_ft = {
                    lua = { "stylua" },
                    python = { "black" },
                    fish = { "fish_indent" },
                    sh = { "shfmt" },
                    ["javascript"] = { "prettier" },
                    ["typescript"] = { "prettier" },
                    ["vue"] = { "prettier" },
                    ["css"] = { "prettier" },
                    ["scss"] = { "prettier" },
                    ["html"] = { "prettier" },
                    ["json"] = { "prettier" },
                    ["jsonc"] = { "prettier" },
                    ["yaml"] = { "prettier" },
                    ["markdown"] = { "prettier" },
                    ["graphql"] = { "prettier" },
                },
            })
        end,
    },
    -- A linter
    {
        "mfussenegger/nvim-lint",
        events = { "BufWritePost", "BufReadPost", "InsertLeave" },
        commit = "32f98300881f38f4e022391f240188fec42f74db",
        config = function()
            local lint = require("lint")

            lint.linters.luacheck.args = {
                "--config",
                require("configs.utils").config_path("luacheckrc"),
                "--formatter",
                "plain",
                "--codes",
                "--ranges",
                "-",
            }

            lint.linters_by_ft = {
                lua = { "luacheck" },
                yaml = { "actionlint" },
            }
        end,
    },
    -- Find the the linter errors
    {
        "folke/trouble.nvim",
        opts = { use_diagnostic_signs = true },
    },
    -- Displays vertical lines to indicate indentation levels.
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "VeryLazy",
        commit = "9637670896b68805430e2f72cf5d16be5b97a22a",
        config = function()
            local icons = require("configs.icons")

            require("indent_blankline").setup({
                buftype_exclude = { "terminal", "nofile" },
                filetype_exclude = {
                    "help",
                    "startify",
                    "dashboard",
                    "lazy",
                    "neogitstatus",
                    "NvimTree",
                    "Trouble",
                    "text",
                },
                -- char = icons.ui.LineLeft,
                char = icons.ui.LineMiddle,
                -- context_char = icons.ui.LineLeft,
                context_char = icons.ui.LineMiddle,
                show_trailing_blankline_indent = false,
                show_first_indent_level = true,
                use_treesitter = true,
                show_current_context = true,
            })
        end,
    },
    -- Color highlighter. à la Emacs rainbow-mode
    {
        "NvChad/nvim-colorizer.lua",
        event = "VeryLazy",
        commit = "dde3084106a70b9a79d48f426f6d6fec6fd203f7",
        config = function()
            require("colorizer").setup({})
        end,
    },
    -- Highlight matching word.
    {
        "RRethy/vim-illuminate",
        event = "VeryLazy",
        commit = "3bd2ab64b5d63b29e05691e624927e5ebbf0fb86",
        config = function()
            local function map(key, dir, buffer)
                vim.keymap.set("n", key, function()
                    require("illuminate")["goto_" .. dir .. "_reference"](false)
                end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
            end

            map("]]", "next")
            map("[[", "prev")

            -- also set it after loading ftplugins, since a lot overwrite [[ and ]]
            vim.api.nvim_create_autocmd("FileType", {
                callback = function()
                    local buffer = vim.api.nvim_get_current_buf()
                    map("]]", "next", buffer)
                    map("[[", "prev", buffer)
                end,
            })

            require("illuminate").configure({
                filetypes_denylist = {
                    "mason",
                    "harpoon",
                    "DressingInput",
                    "NeogitCommitMessage",
                    "qf",
                    "dirvish",
                    "minifiles",
                    "fugitive",
                    "alpha",
                    "NvimTree",
                    "lazy",
                    "NeogitStatus",
                    "Trouble",
                    "netrw",
                    "lir",
                    "DiffviewFiles",
                    "Outline",
                    "Jaq",
                    "spectre_panel",
                    "toggleterm",
                    "DressingSelect",
                    "TelescopePrompt",
                },
                delay = 200,
                large_file_cutoff = 2000,
                large_file_overrides = {
                    providers = { "lsp" },
                },
            })
        end,
    },
    -- Automatic pairing of brackets, quotes, etc.
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        commit = "f6c71641f6f183427a651c0ce4ba3fb89404fa9e",
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
    -- Enhances commenting functionality.
    {
        "numToStr/Comment.nvim",
        event = "VeryLazy",
        lazy = false,
        commit = "0236521ea582747b58869cb72f70ccfa967d2e89",
        config = function()
            require("Comment").setup({
                ---Add a space b/w comment and the line
                padding = true,
                ---Whether the cursor should stay at its position
                sticky = true,
                ---Lines to be ignored while (un)comment
                ignore = nil,
                ---LHS of toggle mappings in NORMAL mode
                toggler = {
                    ---Line-comment toggle keymap
                    line = "gcc",
                    ---Block-comment toggle keymap
                    block = "gbc",
                },
                ---LHS of operator-pending mappings in NORMAL and VISUAL mode
                opleader = {
                    ---Line-comment keymap
                    line = "gc",
                    ---Block-comment keymap
                    block = "gb",
                },
                ---LHS of extra mappings
                extra = {
                    ---Add comment on the line above
                    above = "gcO",
                    ---Add comment on the line below
                    below = "gco",
                    ---Add comment at the end of line
                    eol = "gcA",
                },
                ---Enable keybindings
                ---NOTE: If given `false` then the plugin won't create any mappings
                mappings = {
                    ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
                    basic = true,
                    ---Extra mapping; `gco`, `gcO`, `gcA`
                    extra = true,
                },
                ---Function to call before (un)comment
                pre_hook = function(...)
                    local loaded, ts_comment = pcall(require, "ts_context_commentstring.integrations.comment_nvim")
                    if loaded and ts_comment then
                        return ts_comment.create_pre_hook()(...)
                    end
                end,
                ---Function to call after (un)comment
                post_hook = nil,
            })
        end,
    },
    -- Show trailing whitespace
    {
        -- Using autocmd and hacky regex always match trailing whitespace
        -- during typing.
        "kaplanz/retrail.nvim",
        event = "VeryLazy",
        commit = "fda098e4b91b98dd4e04a9a87537cf70c25ea2ad",
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
                "tsserver", -- TypeScript language server
                "jsonls", -- JSON language server
                "tailwindcss", -- Tailwind language server
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
                    "shfmt", -- formatting
                    -- FE
                    "prettier", -- formatter
                    "eslint-lsp", -- linter
                    "stylelint", -- linter
                    -- Misc
                    "cspell", -- spell checker
                },
            })
        end,
    },
}
