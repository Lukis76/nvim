return {
    "hrsh7th/nvim-cmp",
    event = "VeryLazy",
    -- Required
    dependencies = {
        { "hrsh7th/cmp-nvim-lsp" },     -- Required
        { "hrsh7th/cmp-buffer" },       -- Optional
        { "hrsh7th/cmp-path" },         -- Optional
        { "saadparwaiz1/cmp_luasnip" }, -- Optional
        { "hrsh7th/cmp-nvim-lua" },     -- Optional
    },
    config = function()
        local cmp = require("cmp")
        -- local icons = require("lucas.icons").kind
        -- function format(_, item)
        --     print("hola")
        --     -- if icons[item.kind] then
        --     item.kind = icons[item.kind] .. " hola " .. item.kind
        --     -- end
        --     item.kind = "hola"
        --     return item
        -- end
        --
        cmp.setup({
            window = {
                completion = cmp.config.window.bordered({
                    border = "rounded",
                    winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:PmenuSel",
                }),
                documentation = cmp.config.window.bordered({
                    border = "rounded",
                    winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:PmenuSel",
                }),
            },
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                ["<S-CR>"] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = true,
                }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "buffer" },
                { name = "path" },
                { name = "cmp_tabnine" },
                { name = "nvim_lua" },
                { name = "calc" },
                { name = "emoji" },
                { name = "treesitter" },
                { name = "crates" },
                { name = "tmux" },
            }),
            formatting = {
                expandable_indicator = true,
                fields = { 'abbr', 'kind', 'menu' },
                format = function(_, vim_item)
                    vim_item.kind = string.format("%s", "L")
                    return vim_item
                end,
            }, --     {
            --     fields = { "kind", "abbr", "menu" },
            --     format = function (entry, buff)
            --         print(buff)
            --     end
            -- },
            experimental = {
                ghost_text = false,
                native_menu = false,
            },
        })
    end
}
