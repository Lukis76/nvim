return {
    "nvim-tree/nvim-tree.lua",
    event = "VeryLazy",
    config = function()
        local config = require("plugins.tree.config")
        require("nvim-tree").setup(config)

        -- local opts = { remap = false }
        --
        -- vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<cr>", opts)
        -- vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<cr>", opts)
        -- vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<cr>", opts)
    end
}
