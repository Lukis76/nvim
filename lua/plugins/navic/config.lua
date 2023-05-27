local M = {}

local opts = {
  icons = {
    Array = K.icons.kind.Array,
    Boolean = K.icons.kind.Boolean,
    Class = K.icons.kind.Class,
    Color = K.icons.kind.Color,
    Constant = K.icons.kind.Constant,
    Constructor = K.icons.kind.Constructor,
    Enum = K.icons.kind.Enum,
    EnumMember = K.icons.kind.EnumMember,
    Event = K.icons.kind.Event,
    Field = K.icons.kind.Field,
    File = K.icons.kind.File,
    Folder = K.icons.kind.Folder,
    Function = K.icons.kind.Function,
    Interface = K.icons.kind.Interface,
    Key = K.icons.kind.Key,
    Keyword = K.icons.kind.Keyword,
    Method = K.icons.kind.Method,
    Module = K.icons.kind.Module,
    Namespace = K.icons.kind.Namespace,
    Null = K.icons.kind.Null,
    Number = K.icons.kind.Number,
    Object = K.icons.kind.Object,
    Operator = K.icons.kind.Operator,
    Package = K.icons.kind.Package,
    Property = K.icons.kind.Property,
    Reference = K.icons.kind.Reference,
    Snippet = K.icons.kind.Snippet,
    String = K.icons.kind.String,
    Struct = K.icons.kind.Struct,
    Text = K.icons.kind.Text,
    TypeParameter = K.icons.kind.TypeParameter,
    Unit = K.icons.kind.Unit,
    Value = K.icons.kind.Value,
    Variable = K.icons.kind.Variable,
  },
  lsp = {
    auto_attach = true,
    preference = nil,
  },
  highlight = true,
  separator = " " .. K.icons.ui.ChevronShortRight .. " ",
  depth_limit = 0,
  depth_limit_indicator = "..",
  -- safe_output = true
}

function M.setup()
  local status_ok, navic = pcall(require, "nvim-navic")

  if status_ok then
    local on_attach = function(client, bufnr)
      if client.server_capabilities.documentSymbolProvider then
        navic.attach(client, bufnr)
      end
    end

    require("lspconfig").clangd.setup({
      on_attach = on_attach,
    })

    navic.setup(opts)
  end
end

return M
