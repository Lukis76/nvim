return {
  "lukas-reineke/indent-blankline.nvim",
  config = function ()
    vim.opt.list = true
    vim.opt.listchars:append "space:⋅"
    vim.opt.listchars:append "eol:↴"
    local config = {
      space_char_blankline = " ",
      -- show_end_of_line = true,
      show_current_context = true,
      show_current_context_start = true,
    }

require("indent_blankline").setup(config)
    
  end,
}