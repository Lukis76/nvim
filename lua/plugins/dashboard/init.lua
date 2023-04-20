return {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    config = function()
        require("plugins.dashboard.config").setup()
    end,
}
