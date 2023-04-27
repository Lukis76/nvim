return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",

  dependencies = {
    "nvim-treesitter/playground",
    "nvim-treesitter/nvim-treesitter-refactor",
    "nvim-treesitter/nvim-treesitter-textobjects",
    "JoosepAlviste/nvim-ts-context-commentstring"
  },
  opts = function()
    return require("plugins.treesitter.opts")
  end,
  config = function(_, opts)
    local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
    if status_ok then
      treesitter.setup(opts)
    end
  end,
}
