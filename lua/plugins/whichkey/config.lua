local M = {}

local opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
}

function M.setup()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    require("which-key").setup(opts)
end

return M
