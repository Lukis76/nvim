local M   = {}

local lsp = require("lsp-zero").preset("recommended")

function M.setup()
    lsp.ensure_installed({
        'tsserver',
        'rust_analyzer',
    })

    lsp.set_sign_icons({
        error = Default.icons.diagnostics.Error,
        warn = Default.icons.diagnostics.Warning,
        hint = Default.icons.diagnostics.Hint,
        info = Default.icons.diagnostics.Information,
    })

    lsp.setup_nvim_cmp({
        formatting = {
            expandable_indicator = true,
            fields = { 'abbr', 'kind', 'menu' },
            format = function(_, vim_item)
                if Default.icons.kind[vim_item.kind] then
                    -- local abbr = vim_item
                    vim_item.abbr = Default.icons.kind[vim_item.kind] .. vim_item.abbr
                end

                -- vim_item.abbr = string.format("%s", "L")
                return vim_item
            end,
        },
    })

    lsp.on_attach(function(_, bufnr)
        require("lucas.mapping").lsp_set_keymap(bufnr)
    end)

    lsp.setup()

    vim.diagnostic.config({
        virtual_text = true
    })
end

return M
