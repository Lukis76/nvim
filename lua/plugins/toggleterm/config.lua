local M = {}

local opts = {
    size = 20,
    open_mapping = [[<c-\>]],
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2,
    shading_in_insert = true,
    persist_size = true,
    direction = "float"
}

function M.setup()
    require("toggleterm").setup(opts)

    -- if you only want these mappings for toggle term use term://*toggleterm#* instead
    vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
end

return M
