return {
  "nvim-lualine/lualine.nvim",
  enabled = K.plugins.lualine,
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = function()
    return require("plugins.lualine.opts")
  end,
  config = function(_, opts)
    local status_ok, lua_line = pcall(require, "lualine")
    if not status_ok then
      return
    end
    lua_line.setup(opts)
  end,
}
