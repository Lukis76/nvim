return {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    dependencies = {
        -- LSP Support
        { "neovim/nvim-lspconfig" },                     -- Required
        { "williamboman/mason.nvim" },                   -- Optional
        { "williamboman/mason-lspconfig.nvim" },         -- Optional
        { "WhoIsSethDaniel/mason-tool-installer.nvim" }, -- Optional

        -- Autocompletion
        { "hrsh7th/nvim-cmp" },         -- Required
        { "hrsh7th/cmp-nvim-lsp" },     -- Required
        { "hrsh7th/cmp-buffer" },       -- Optional
        { "hrsh7th/cmp-path" },         -- Optional
        { "saadparwaiz1/cmp_luasnip" }, -- Optional
        { "hrsh7th/cmp-nvim-lua" },     -- Optional

        -- Snippets
        { "L3MON4D3/LuaSnip" },             -- Required
        { "rafamadriz/friendly-snippets" }, -- Optional
    },
    config = function()
        local lsp   = require("lsp-zero").preset("recommended")
        local icons = require("lucas.icons")
        local opts  = require("plugins.lsp.completition")

        lsp.ensure_installed({
            'tsserver',
            'rust_analyzer',
        })

        lsp.set_sign_icons({
            error = icons.diagnostics.Error,
            warn = icons.diagnostics.Warning,
            hint = icons.diagnostics.Hint,
            info = icons.diagnostics.Information,
        })

        lsp.setup_nvim_cmp({
            formatting = {
                expandable_indicator = true,
                fields = { 'abbr', 'kind', 'menu' },
                format = function(_, vim_item)

                    if icons.kind[vim_item.kind] then
                        -- local abbr = vim_item
                        vim_item.abbr = icons.kind[vim_item.kind] .. vim_item.abbr
                    end

                    -- vim_item.abbr = string.format("%s", "L")
                    return vim_item
                end,
            },
        })

        lsp.on_attach(function(client, bufnr)
            opts = { buffer = bufnr, remap = false }

            vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
            vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
            vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
            vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
            vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
            vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
            vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
            vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
            vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
            vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
            vim.keymap.set("n", "<leader>ff", function() vim.lsp.buf.format() end, opts)
        end)

        lsp.setup()

        vim.diagnostic.config({
            virtual_text = true
        })
    end,
}
