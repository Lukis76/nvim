return {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
        require("plugins.toggleterm.config").setup()
    end
}