return {
    "NTBBloodbath/rest.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    ft = "http",
    config = function()
        require("plugins.rest.config").setup()
    end,
}

