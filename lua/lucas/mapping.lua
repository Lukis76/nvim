local M = {}

local map = vim.keymap.set
local api_map = vim.api.nvim_set_keymap


function close_and_last_buffer()
    local current_bufnr = vim.fn.bufnr('%')
    local last_bufnr = vim.fn.bufnr('#')
    vim.cmd('bd')
    if last_bufnr ~= current_bufnr then
        vim.cmd('buffer ' .. last_bufnr)
    end
end
-- cursor motion
api_map('n', '<C-h>', '<C-w>h', { noremap = true })
api_map('n', '<C-l>', '<C-w>l', { noremap = true })
api_map('n', '<C-j', '<C-w>j', { noremap = true })
api_map('n', '<C-k>', '<C-w>k', { noremap = true })


-- buffer line
api_map('n', "<S-j>", ':BufferLineCycleNext<CR>', { silent = true, noremap = true })
api_map('n', "<S-h>", ':BufferLineCyclePrev<CR>', { silent = true, noremap = true })
api_map('n', '<S-x>', ":lua close_and_last_buffer()<CR>", { silent = true, noremap = true })

-- tree mapping
api_map("n", "<S-tab>", ":NvimTreeToggle<cr>", { silent = true, noremap = true })
-- api_map("n", "<leader>e", ":NvimTreeToggle<cr>", { silent = true, noremap = true })
api_map("n", "<leader>efo", ":NvimTreeFocus<cr>", { silent = true, noremap = true })
api_map("n", "<leader>efi", ":NvimTreeFindFile<cr>", { silent = true, noremap = true })
api_map("n", "<leader>eco", ":NvimTreeCollapse<cr>", { silent = true, noremap = true })


-- toggle trem
function _G.set_terminal_keymaps()
    local opt = { buffer = 0 }
    map('t', '<esc>', [[<C-\><C-n>]], opt)
    map('t', 'jk', [[<C-\><C-n>]], opt)
    map('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opt)
    map('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opt)
    map('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opt)
    map('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opt)
    map('t', '<C-w>', [[<C-\><C-n><C-w>]], opt)
end



function M.lsp_set_keymap(bufnr)
    local opts = { buffer = bufnr, remap = false }

    map("n", "gd", function() vim.lsp.buf.definition() end, opts)
    map("n", "K", function() vim.lsp.buf.hover() end, opts)
    map("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    map("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    map("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    map("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    map("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    map("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    map("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    map("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    map("n", "<leader>ff", function() vim.lsp.buf.format() end, opts)
end

return M
