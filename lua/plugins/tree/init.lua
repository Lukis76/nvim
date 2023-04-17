return  {
  "nvim-tree/nvim-tree.lua",
  event = "VeryLazy",
  config = function ()
    local config = require("plugins.tree.config")
    require("nvim-tree").setup(config)
  end
}