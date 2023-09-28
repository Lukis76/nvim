local M = {}


local cmd = vim.cmd
local buff = vim.fn.bufnr
local map = vim.keymap.set
local api_map = vim.api.nvim_set_keymap
local api_buf_map = vim.api.nvim_buf_set_keymap


function close_and_last_buffer()
    local current_bufnr = buff('%')
    local last_bufnr = buff('#')
    cmd('bd')
    if last_bufnr ~= current_bufnr then
        cmd('buffer ' .. last_bufnr)
    end
end

-- cursor motion
api_map('n', '<C-h>', '<C-w>h', { noremap = true })
api_map('n', '<C-l>', '<C-w>l', { noremap = true })
api_map('n', '<C-j', '<C-w>j', { noremap = true })
api_map('n', '<C-k>', '<C-w>k', { noremap = true })


-- buffer line
api_map('n', "<S-l>", ':BufferLineCycleNext<CR>', { silent = true, noremap = true })
api_map('n', "<S-h>", ':BufferLineCyclePrev<CR>', { silent = true, noremap = true })
api_map('n', '<S-x>', ":lua close_and_last_buffer()<CR>", { silent = true, noremap = true })

-- tree mapping
api_map("n", "<S-tab>", ":NvimTreeToggle<cr>", { silent = true, noremap = true })
-- api_map("n", "<leader>e", ":NvimTreeToggle<cr>", { silent = true, noremap = true })
api_map("n", "<leader>efo", ":NvimTreeFocus<cr>", { silent = true, noremap = true })
api_map("n", "<leader>efi", ":NvimTreeFindFile<cr>", { silent = true, noremap = true })
api_map("n", "<leader>eco", ":NvimTreeCollapse<cr>", { silent = true, noremap = true })


-- access fast
-- require("lvim.config"):get_user_config_path()
api_map("n", "<leader>cc", ":lua vim.cmd('edit $MYVIMRC')<CR>", { silent = true, noremap = true })


-- toggle trem
function _G.set_terminal_keymaps()
    local opt = { noremap = true }
    api_buf_map(0, 't', '<esc>', [[<C-\><C-n>]], opt)
    api_buf_map(0, 't', 'jk', [[<C-\><C-n>]], opt)
    api_buf_map(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opt)
    api_buf_map(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opt)
    api_buf_map(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opt)
    api_buf_map(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opt)
    api_buf_map(0, 't', '<C-w>', [[<C-\><C-n><C-w>]], opt)
end

function M.lsp_set_keymap(bufnr)
    local opts = { buffer = bufnr, remap = false }

    -- map("n", "<leader>cc", function() require("lvim.config"):get_user_config_path() end, opts)

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
