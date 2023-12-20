local M = {
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
}

function M.config()
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

    local icons = require("plugins.icons")

    cmp.setup({
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body) -- For `luasnip` users.
            end,
        },
        mapping = {
            ["<Up>"] = cmp.mapping.select_prev_item({
                behavior = cmp.SelectBehavior.Select,
            }),
            ["<Down>"] = cmp.mapping.select_next_item({
                behavior = cmp.SelectBehavior.Select,
            }),
            ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
            ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
            ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
            ["<C-y>"] = cmp.config.disable,
            ["<C-e>"] = cmp.mapping({
                i = cmp.mapping.abort(),
                c = cmp.mapping.close(),
            }),
            ["<CR>"] = cmp.mapping.confirm({ select = false }),
            ["<Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                elseif has_words_before() then
                    cmp.complete()
                else
                    fallback()
                end
            end, { "i", "s" }),
            ["<S-Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end, { "i", "s" }),
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
end

return M
