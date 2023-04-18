return {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    dependencies = {
        -- LSP Support
        {"neovim/nvim-lspconfig"},                       -- Required
        {"williamboman/mason.nvim"},                     -- Optional
        {"williamboman/mason-lspconfig.nvim"},           -- Optional
        {"WhoIsSethDaniel/mason-tool-installer.nvim"},   -- Optional
  
        -- Autocompletion
        {"hrsh7th/nvim-cmp"},           -- Required
        {"hrsh7th/cmp-nvim-lsp"},       -- Required
        {"hrsh7th/cmp-buffer"},         -- Optional
        {"hrsh7th/cmp-path"},           -- Optional
        {"saadparwaiz1/cmp_luasnip"},   -- Optional
        {"hrsh7th/cmp-nvim-lua"},       -- Optional
  
        -- Snippets
        {"L3MON4D3/LuaSnip"},               -- Required
        {"rafamadriz/friendly-snippets"},   -- Optional
    },
    config = function()

        local lsp = require("lsp-zero").preset("recommended")
        local icons  = require("lucas.icons")
        lsp.ensure_installed({
          'tsserver',
          'rust_analyzer',
        --   'lua-language-server'
        })
        
        -- Fix Undefined global 'vim'
        -- lsp.configure('lua-language-server', {
        --     settings = {
        --         Lua = {
        --             diagnostics = {
        --                 globals = { 'vim' }
        --             }
        --         }
        --     }
        -- })
        
        
        local cmp = require('cmp')
        local cmp_select = {behavior = cmp.SelectBehavior.Select}
        local cmp_mappings = lsp.defaults.cmp_mappings({
          ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
          ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
          ['<cr>'] = cmp.mapping.confirm({ select = true }),
          ["<C-Space>"] = cmp.mapping.complete(),
        })
        
        cmp_mappings['<Tab>'] = nil
        cmp_mappings['<S-Tab>'] = nil
        
        lsp.setup_nvim_cmp({
          mapping = cmp_mappings
        })
        
        lsp.set_sign_icons({
                error = icons.diagnostics.Error,
                warn = icons.diagnostics.Warning,
                hint = icons.diagnostics.Hint,
                info = icons.diagnostics.Information,
            })
        
        lsp.on_attach(function(client, bufnr)
          local opts = {buffer = bufnr, remap = false}
        
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
        end)
        
        lsp.setup()
        
        vim.diagnostic.config({
            virtual_text = true
        })
  
        -- When you don't have mason.nvim installed
        -- You'll need to list the servers installed in your system
        -- lsp.setup_servers({ "tsserver", "eslint" })
  
        -- (Optional) Configure lua language server for neovim
        -- lsp.nvim_workspace()
  
        -- lsp.setup()
  
        -- Restart lsp
        -- vim.api.nvim_set_keymap("n", "<leader>lr", ":LspRestart<cr>", { noremap = true })
        -- -- hover a la definicion como vscode
        -- vim.api.nvim_set_keymap("n", "K", ":lua vim.lsp.buf.hover()<cr>", { noremap = true })
        -- -- formatedo de buffer o archivo en el que estamos
        -- vim.api.nvim_set_keymap("n", "<leader>ff", ":lua vim.lsp.buf.format()<cr>", { noremap = true })
        -- -- ir a la implementacion
        -- vim.api.nvim_set_keymap("n", "<leader>vi", ":lua vim.lsp.buf.implementation()<cr>", { noremap = true })
        -- -- renombrar una variable, etc
        -- vim.api.nvim_set_keymap("n", "<leader>vr", ":lua vim.lsp.buf.rename()<cr>", { noremap = true })
  
    end,
  }
  -- return {
  --   'VonHeikemen/lsp-zero.nvim',
  --   branch = 'v2.x',
  --   dependencies = {
  --     -- LSP Support
  --     {'neovim/nvim-lspconfig'},             -- Required
  --     {                                      -- Optional
  --       'williamboman/mason.nvim',
  --       -- build = function()
  --       --   pcall(vim.cmd, 'MasonUpdate')
  --       -- end,
  --     },
  --     {'williamboman/mason-lspconfig.nvim'}, -- Optional
  
  --     -- Autocompletion
  --     {'hrsh7th/nvim-cmp'},     -- Required
  --     {'hrsh7th/cmp-nvim-lsp'}, -- Required
  --     {'L3MON4D3/LuaSnip'},     -- Required
  --   }
  -- }