return {
  "SmiteshP/nvim-navic",
  dependencies = {
    "neovim/nvim-lspconfig"
  },
  config = function()
    -- local navic = require("nvim-navic")
    local icons = require("lucas.icons")
    local config =  {
      icons = {
        Array = icons.kind.Array .. " ",
        Boolean = icons.kind.Boolean,
        Class = icons.kind.Class .. " ",
        Color = icons.kind.Color .. " ",
        Constant = icons.kind.Constant .. " ",
        Constructor = icons.kind.Constructor .. " ",
        Enum = icons.kind.Enum .. " ",
        EnumMember = icons.kind.EnumMember .. " ",
        Event = icons.kind.Event .. " ",
        Field = icons.kind.Field .. " ",
        File = icons.kind.File .. " ",
        Folder = icons.kind.Folder .. " ",
        Function = icons.kind.Function .. " ",
        Interface = icons.kind.Interface .. " ",
        Key = icons.kind.Key .. " ",
        Keyword = icons.kind.Keyword .. " ",
        Method = icons.kind.Method .. " ",
        Module = icons.kind.Module .. " ",
        Namespace = icons.kind.Namespace .. " ",
        Null = icons.kind.Null .. " ",
        Number = icons.kind.Number .. " ",
        Object = icons.kind.Object .. " ",
        Operator = icons.kind.Operator .. " ",
        Package = icons.kind.Package .. " ",
        Property = icons.kind.Property .. " ",
        Reference = icons.kind.Reference .. " ",
        Snippet = icons.kind.Snippet .. " ",
        String = icons.kind.String .. " ",
        Struct = icons.kind.Struct .. " ",
        Text = icons.kind.Text .. " ",
        TypeParameter = icons.kind.TypeParameter .. " ",
        Unit = icons.kind.Unit .. " ",
        Value = icons.kind.Value .. " ",
        Variable = icons.kind.Variable .. " ",
      },
    lsp = {
        auto_attach = true,
        preference = nil,
    },
    highlight = true,
    separator = " " .. icons.ui.ChevronShortRight .. " ",
    depth_limit = 0,
    depth_limit_indicator = "..",
    safe_output = true
    }


















  -- local on_attach = function(client, bufnr)
  --   -- if client.server_capabilities.documentSymbolProvider then
  --     navic.attach(client, bufnr)
  --   -- end
  -- end

  -- require("lspconfig").clangd.setup {
  --     on_attach = on_attach
  -- }
  require("nvim-navic").setup({})
  end,
}