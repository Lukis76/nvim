return {
    "Pocco81/auto-save.nvim",
    event = "VeryLazy",
    config = function()
        require("plugins.autosave.config").setup()
    end
}

