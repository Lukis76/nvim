return {
    "nvim-tree/nvim-tree.lua",
    lazy = true,
    enabled = Default.plugins.tree,
    cmd = { "NvimTreeToggle", "NvimTreeOpen", "NvimTreeFocus", "NvimTreeFindFileToggle" },
    event = "VeryLazy",
    config = function()
        require("plugins.tree.config").setup()
    end
}
