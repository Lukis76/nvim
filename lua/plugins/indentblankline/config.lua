local M = {}

local opts = {
    space_char_blankline = " ",
    -- show_end_of_line = true,
    show_current_context = true,
    show_current_context_start = true,
}

function M.setup()
    vim.opt.list = true
    -- vim.opt.listchars:append "space:⋅"
    -- vim.opt.listchars:append "eol:↴"

    require("indent_blankline").setup(opts)
end

return M
