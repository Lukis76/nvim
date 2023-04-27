return {
  "Pocco81/auto-save.nvim",
  enabled = K.plugins.auto_save,
  event = "VeryLazy",
  opts = function()
    return require("plugins.autosave.opts")
  end,
  config = function(_, opts)
    local status_ok, auto_save = pcall(require, "auto-save")
    if not status_ok then
      return
    end
    auto_save.setup(opts)
  end
}
