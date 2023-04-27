local M = {}


function M:init()
  _G.K = {
    plugins = {
      auto_save        = true,
      cmp              = true,
      dashboard        = true,
      indent_bank_line = true,
      lsp              = true,
      lualine          = true,
      navic            = true,
      noice            = true,
      notify           = true,
      null_ls          = true,
      project          = true,
      rest             = true,
      smooth_cursor    = true,
      telescope        = true,
      todo_comments    = true,
      toggle_term      = true,
      tree             = true,
      treesitter       = true,
      whiskey          = true,
      auto_tag         = true,
      buffer_line      = true,
      colorizer        = true,
      color_schema     = true,
      comment          = true,
      dev_icons        = true,
      dressing         = true,
      harpoon          = true,
      icon_picker      = true,
      lua_snip         = true,
      min_surround     = true,
      mini_ai          = true,
      mini_pairs       = true,
      refactoring      = true,
      smart_split      = true,
      trouble          = true,
    },
    icons = require("lucas.icons")
  }
end

return M
