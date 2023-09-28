return {
    "folke/which-key.nvim",
    cmd = "WhichKey",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
    opts = require("plugins.whichkey.config").opts,
    config = function(_, opts)
        require("plugins.whichkey.config").setup(opts)
    end,
}
