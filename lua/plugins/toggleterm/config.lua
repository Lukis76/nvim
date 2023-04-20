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
function _G.set_terminal_keymaps()
    local opt = { buffer = 0 }
    local map = vim.keymap.set
    map('t', '<esc>', [[<C-\><C-n>]], opt)
    map('t', 'jk', [[<C-\><C-n>]], opt)
    map('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opt)
    map('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opt)
    map('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opt)
    map('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opt)
    map('t', '<C-w>', [[<C-\><C-n><C-w>]], opt)
end

function M.setup()
    require("toggleterm").setup(opts)


    -- if you only want these mappings for toggle term use term://*toggleterm#* instead
    vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
end

return M
