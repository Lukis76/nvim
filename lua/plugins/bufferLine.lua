return {
    'akinsho/bufferline.nvim',
    -- event = "VeryLazy",
    lazy = false,
    enabled = Default.plugins.bufferLine,
    config = function()
        require("bufferline").setup({})
    end
}
