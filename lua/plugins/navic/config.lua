local M = {}

M.options = {
    icons = {
        Array = Default.icons.kind.Array,
        Boolean = Default.icons.kind.Boolean,
        Class = Default.icons.kind.Class,
        Color = Default.icons.kind.Color,
        Constant = Default.icons.kind.Constant,
        Constructor = Default.icons.kind.Constructor,
        Enum = Default.icons.kind.Enum,
        EnumMember = Default.icons.kind.EnumMember,
        Event = Default.icons.kind.Event,
        Field = Default.icons.kind.Field,
        File = Default.icons.kind.File,
        Folder = Default.icons.kind.Folder,
        Function = Default.icons.kind.Function,
        Interface = Default.icons.kind.Interface,
        Key = Default.icons.kind.Key,
        Keyword = Default.icons.kind.Keyword,
        Method = Default.icons.kind.Method,
        Module = Default.icons.kind.Module,
        Namespace = Default.icons.kind.Namespace,
        Null = Default.icons.kind.Null,
        Number = Default.icons.kind.Number,
        Object = Default.icons.kind.Object,
        Operator = Default.icons.kind.Operator,
        Package = Default.icons.kind.Package,
        Property = Default.icons.kind.Property,
        Reference = Default.icons.kind.Reference,
        Snippet = Default.icons.kind.Snippet,
        String = Default.icons.kind.String,
        Struct = Default.icons.kind.Struct,
        Text = Default.icons.kind.Text,
        TypeParameter = Default.icons.kind.TypeParameter,
        Unit = Default.icons.kind.Unit,
        Value = Default.icons.kind.Value,
        Variable = Default.icons.kind.Variable,
    },
    lsp = {
        auto_attach = true,
        preference = nil,
    },
    highlight = true,
    separator = " " .. Default.icons.ui.ChevronShortRight .. " ",
    depth_limit = 0,
    depth_limit_indicator = "..",
    -- safe_output = true
}

return M

