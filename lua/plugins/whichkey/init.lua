return {
    "folke/which-key.nvim",
    -- cmd = "Which-Key",
    event = "VeryLazy",
    config = function()
        require("plugins.whichkey.config").setup()
    end,
}
