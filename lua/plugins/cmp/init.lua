return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    { "hrsh7th/cmp-nvim-lsp" },       -- Required
    { "hrsh7th/cmp-buffer" },         -- Optional
    { "hrsh7th/cmp-path" },           -- Optional
    { "saadparwaiz1/cmp_luasnip" },   -- Optional
    { "hrsh7th/cmp-nvim-lua" },       -- Optional
    { "L3MON4D3/LuaSnip" },           -- Optional
    { "hrsh7th/cmp-cmdline" },        -- Optional
    { "rafamadriz/friendly-snippets" }, -- Optional
  },
  opts = function()
    return require("plugins.cmp.opts")
  end,
  config = function(_, opts)
    require("luasnip.loaders.from_vscode").lazy_load()
    local status_ok, cmp = pcall(require, "cmp")

    if not status_ok then
      return
    end

    cmp.setup(opts)
  end,
}
