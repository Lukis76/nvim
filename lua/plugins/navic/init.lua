return {
    "SmiteshP/nvim-navic",
--     event = "User FileOpened",
    enabled = K.plugins.navic,
    dependencies = {
        "neovim/nvim-lspconfig"
    },
    -- lazy = false,
    config = function()
        require("plugins.navic.config").setup()
    end
}

