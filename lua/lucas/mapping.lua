-- vim.api.nvim_set_keymap('n', 'j', 'h', { noremap =  true} )
-- vim.api.nvim_set_keymap('n', 'k', 'j', { noremap =  true} )
-- vim.api.nvim_set_keymap('n', 'l', 'k', { noremap =  true} )
-- vim.api.nvim_set_keymap('n', ';', 'l', { noremap =  true} )
--
-- vim.api.nvim_set_keymap('v', 'j', 'h', { noremap =  true} )
-- vim.api.nvim_set_keymap('v', 'k', 'j', { noremap =  true} )
-- vim.api.nvim_set_keymap('v', 'l', 'k', { noremap =  true} )
-- vim.api.nvim_set_keymap('v', ';', 'l', { noremap =  true} )

function close_and_last_buffer()
  local current_bufnr = vim.fn.bufnr('%')
  local last_bufnr = vim.fn.bufnr('#')
  vim.cmd('bd')
  if last_bufnr ~= current_bufnr then
    vim.cmd('buffer '..last_bufnr)
  end
end

vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap =  true} )
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap =  true} )
vim.api.nvim_set_keymap('n', '<C-j', '<C-w>j', { noremap =  true} )
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap =  true} )



vim.api.nvim_set_keymap('n', "<S-j>", ':BufferLineCycleNext<CR>', { silent = true, noremap =  true} )
vim.api.nvim_set_keymap('n', "<S-h>", ':BufferLineCyclePrev<CR>', { silent = true, noremap =  true} )
vim.api.nvim_set_keymap('n', '<S-x>', ':lua close_and_last_buffer()<cr>', { silent = true, noremap =  true} )





-- lvim.keys.normal_mode["<S-;>"] = ":BufferLineCycleNext<CR>"
-- lvim.keys.normal_mode["<S-j>"] = ":BufferLineCyclePrev<CR>"
-- lvim.keys.normal_mode["<S-x>"] = ":BufferKill<CR>"
