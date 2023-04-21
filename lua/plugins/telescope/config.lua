local M = {}

local icons = require("lucas.icons")
local opts = {
    defaults = {
        prompt_prefix = icons.ui.Select .. " ",
        selection_caret = icons.ui.Select .. " ",
        winblend = 0,
        layout_strategy = "horizontal",
        layout_config = {
            width = 0.95,
            height = 0.85,
            -- preview_cutoff = 120,
            prompt_position = "bottom",
            horizontal = {
                preview_width = function(_, cols, _)
                    if cols > 200 then
                        return math.floor(cols * 0.5)
                    else
                        return math.floor(cols * 0.6)
                    end
                end,
            },
            vertical = {
                width = 0.95,
                height = 0.95,
                preview_height = 0.5,
            },
            flex = {
                horizontal = {
                    preview_width = 0.9,
                },
            },
        },
        selection_strategy = "reset",
        sorting_strategy = "descending",
        scroll_strategy = "cycle",
        color_devicons = true,
    }
}

function M.setup()
    local telescope = require("telescope")
    local builtin = require("telescope.builtin")
    telescope.load_extension("projects")

    builtin.grep = function()
        local grep = "Grep" .. " " .. icons.ui.Select .. " "
        builtin.grep_string({ search = vim.fn.input(grep) })
    end
    vim.keymap.set("n", "<leader>fp", builtin.find_files, {})
    vim.keymap.set("n", "<C-p>", builtin.git_files, {})
    vim.keymap.set("n", "<leader>fg", builtin.grep, {})
    vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

    telescope.setup(opts)
end

return M
