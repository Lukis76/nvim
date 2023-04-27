return {
  "nvim-tree/nvim-tree.lua",
  lazy = true,
  enabled = K.plugins.tree,
  cmd = { "NvimTreeToggle", "NvimTreeOpen", "NvimTreeFocus", "NvimTreeFindFileToggle" },
  event = "VeryLazy",
  opts = function()
    return require("plugins.tree.opts")
  end,
  config = function(_, opts)
    local status_ok, nvim_tree = pcall(require, "nvim-tree")
    if not status_ok then
      return
    end
    nvim_tree.setup(opts)
  end
}
