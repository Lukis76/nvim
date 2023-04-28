local M = {}

function M:init()
  _G.K = {
    active_window = "",
    plugins = {
      auto_save = true,
      cmp = true,
      dashboard = true,
      indent_bank_line = true,
      lsp = true,
      lualine = true,
      navic = true,
      noice = true,
      notify = true,
      null_ls = true,
      project = true,
      rest = true,
      smooth_cursor = true,
      telescope = true,
      todo_comments = true,
      toggle_term = true,
      tree = true,
      treesitter = true,
      whiskey = true,
      auto_tag = true,
      buffer_line = true,
      colorizer = true,
      color_schema = true,
      comment = true,
      dev_icons = true,
      dressing = true,
      harpoon = true,
      icon_picker = true,
      lua_snip = true,
      min_surround = true,
      mini_ai = true,
      mini_pairs = true,
      refactoring = true,
      smart_split = true,
      trouble = true,
    },
    icons = require("lucas.icons"),
  }

  -- Función para actualizar la variable global cuando cambia la ventana activa
  function UpdateActiveWin()
    K.active_window = vim.api.nvim_eval('bufname("%")')
    print(K.active_window)
--   if K.active_window ~= vim.api.nvim_eval('bufname("%")') then
--     K.plugins.lualine = false
--   else
--     K.plugins.lualine = true
--   end
  end


-- Función para activar o desactivar el plugin "lualine" en función de la ventana activa
function ToggleLualine()
  if K.active_window ~= vim.api.nvim_eval('bufname("%")') then
    K.plugins.lualine = false
  else
    K.plugins.lualine = true
  end
end

  -- Ejecutar la función 'UpdateActiveWin' cada vez que cambie la ventana
  vim.api.nvim_exec(
    [[
  autocmd WinEnter * lua UpdateActiveWin()
]],
    false
  )
end

return M
