-- return {
--     'glepnir/dashboard-nvim',
--     event = 'VimEnter',
--     dependencies = { { 'nvim-tree/nvim-web-devicons' } },
--     config = function()
--         require("plugins.dashboard.config").setup()
--     end,
-- }
return {
    'goolord/alpha-nvim',
    event = "VimEnter",
    config = function ()
        require("plugins.dashboard.config").setup()
    end

}