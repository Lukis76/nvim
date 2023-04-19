return {
    "nvim-tree/nvim-tree.lua",
    lazy = true,
    enabled = Default.plugins.tree,
    cmd = { "NvimTreeToggle", "NvimTreeOpen", "NvimTreeFocus", "NvimTreeFindFileToggle" },
    event = "VeryLazy",
    config = function()
        local config = require("plugins.tree.config")
        require("nvim-tree").setup(config)

        local opts = {silent = true, remap = false }
        --
        vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<cr>", opts)
        vim.keymap.set("n", "<leader>efo", ":NvimTreeFocus<cr>", opts)
        vim.keymap.set("n", "<leader>efi", ":NvimTreeFindFile<cr>", opts)
        vim.keymap.set("n", "<leader>eco", ":NvimTreeCollapse<cr>", opts)
    end
}
