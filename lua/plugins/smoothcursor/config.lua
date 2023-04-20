local M = {}

function M.setup()
    -- TODO: --  --  --  --  --  --  --
    require("smoothcursor").setup { cursor = "", bg = "#FFFFFF", fg = "#09f" } --

    vim.api.nvim_set_hl(0, "SmoothCursor", { fg = "#8a9baa" })

    local autocmd = vim.api.nvim_create_autocmd

    autocmd({ "ModeChanged" }, {
        callback = function()
            local icons = require("lucas.icons")
            local current_mode = vim.fn.mode()
            if current_mode == "n" then
                vim.api.nvim_set_hl(0, "SmoothCursor", { fg = "#8a9baa" })
                vim.fn.sign_define("smoothcursor", { text = "" })
            elseif current_mode == "v" then
                vim.api.nvim_set_hl(0, "SmoothCursor", { fg = "#bf616a" })
                vim.fn.sign_define("smoothcursor", { text = "" })
            elseif current_mode == "V" then
                vim.api.nvim_set_hl(0, "SmoothCursor", { fg = "#bf616a" })
                vim.fn.sign_define("smoothcursor", { text = "" })
            elseif current_mode == "\22" then
                vim.api.nvim_set_hl(0, "SmoothCursor", { fg = "#bf616a" })
                vim.fn.sign_define("smoothcursor", { text = "" })
            elseif current_mode == "i" then
                vim.api.nvim_set_hl(0, "SmoothCursor", { fg = "#668aab" })
                vim.fn.sign_define("smoothcursor", { text = icons.ui.BoldArrowRight })
            end
        end,
    })
end

return M
