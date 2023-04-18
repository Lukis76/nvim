return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    config = function()
        local colors = {
            black = "#202328",
            white = "#bbc2cf",
            yellow = "#ECBE7B",
            cyan = "#008080",
            darkblue = "#081633",
            green = "#98be65",
            orange = "#FF8800",
            violet = "#a9a1e1",
            magenta = "#c678dd",
            purple = "#c678dd",
            blue = "#51afef",
            red = "#ec5f67",
        }

        local conditions = {
            buffer_not_empty = function()
                return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
            end,
            hide_in_width = function()
                return vim.fn.winwidth(0) > 80
            end,
            check_git_workspace = function()
                local filepath = vim.fn.expand("%:p:h")
                local gitdir = vim.fn.finddir(".git", filepath .. ";")
                return gitdir and #gitdir > 0 and #gitdir < #filepath
            end,
        }

        -- Config
        local config = {
            options = {
                -- Disable sections and component separators
                component_separators = "",
                section_separators = "",
                theme = {
                    -- We are going to use lualine_c an lualine_x as left and
                    -- right section. Both are highlighted by c theme .  So we
                    -- are just setting default looks o statusline
                    normal = {
                        a = { fg = colors.black, bg = colors.blue },
                        b = { fg = colors.blue, bg = colors.grey },
                        c = { fg = colors.white, bg = colors.black },
                        x = { fg = colors.white, bg = colors.black },
                        y = { fg = colors.blue, bg = colors.grey },
                        z = { fg = colors.black, bg = colors.blue },
                    },
                    insert = {
                        a = { fg = colors.black, bg = colors.green },
                        b = { fg = colors.green, bg = colors.grey },
                        c = { fg = colors.white, bg = colors.black },
                        x = { fg = colors.white, bg = colors.black },
                        y = { fg = colors.green, bg = colors.grey },
                        z = { fg = colors.black, bg = colors.green },
                    },
                    visual = {
                        a = { fg = colors.black, bg = colors.magenta },
                        b = { fg = colors.magenta, bg = colors.grey },
                        c = { fg = colors.white, bg = colors.black },
                        x = { fg = colors.white, bg = colors.black },
                        y = { fg = colors.magenta, bg = colors.grey },
                        z = { fg = colors.black, bg = colors.magenta },
                    },
                    command = {
                        a = { fg = colors.black, bg = colors.yellow },
                        b = { fg = colors.yellow, bg = colors.grey },
                        c = { fg = colors.white, bg = colors.black },
                        x = { fg = colors.white, bg = colors.black },
                        y = { fg = colors.yellow, bg = colors.grey },
                        z = { fg = colors.black, bg = colors.yellow },
                    },
                    inactive = { c = { fg = colors.white, bg = colors.black } },
                },
            },
            sections = {
                -- these are to remove the defaults
                lualine_a = {},
                lualine_c = {},
                lualine_b = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {},
            },
            inactive_sections = {
                -- these are to remove the defaults
                lualine_a = {},
                lualine_c = {},
                lualine_b = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {},
            },
        }

        -- Inserts a component in lualine_a at left section
        local function ins_left_a(component)
            table.insert(config.sections.lualine_a, component)
        end

        -- Inserts a component in lualine_b at left section
        local function ins_left_b(component)
            table.insert(config.sections.lualine_b, component)
        end

        -- Inserts a component in lualine_c at left section
        local function ins_left_c(component)
            table.insert(config.sections.lualine_c, component)
        end

        -- Inserts a component in lualine_x at right section
        local function ins_right_x(component)
            table.insert(config.sections.lualine_x, component)
        end

        -- Inserts a component in lualine_y at right section
        local function ins_right_y(component)
            table.insert(config.sections.lualine_y, component)
        end

        -- Inserts a component in lualine_z at right section
        local function ins_right_z(component)
            table.insert(config.sections.lualine_z, component)
        end

        ins_left_a({
            "mode",
            color = { fg = colors.black },
        })

        ins_left_b({
            "branch",
            color = { bg = colors.grey, gui = "bold" },
        })

        ins_left_c({
            "filename",
            cond = conditions.buffer_not_empty,
            color = { fg = colors.white, gui = "bold" },
        })

        ins_left_c({
            "diff",
            -- Is it me or the symbol for modified us really weird
            symbols = { added = " ", modified = " ", removed = " " }, -- 柳
            diff_color = {
                added = { fg = colors.green },
                modified = { fg = colors.orange },
                removed = { fg = colors.red },
            },
            cond = conditions.hide_in_width,
        })

        ins_right_x({
            "diagnostics",
            sources = { "nvim_diagnostic" },
            symbols = { error = " ", warn = " ", info = " " },
            diagnostics_color = {
                color_error = { fg = colors.red },
                color_warn = { fg = colors.yellow },
                color_info = { fg = colors.cyan },
            },
        })

        ins_right_x({
            -- Lsp server name .
            function()
                local msg = "[lsp]"
                local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
                local clients = vim.lsp.get_active_clients()
                if next(clients) == nil then
                    return msg
                end
                for _, client in ipairs(clients) do
                    local filetypes = client.config.filetypes
                    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                        return client.name
                    end
                end
                return msg
            end,
            -- icon = ' LSP:',
            color = { fg = colors.white, gui = "bold" },
        })

        ins_right_x({
            "filetype",
            icons_enabled = true,
            color = { fg = colors.white, gui = "bold" },
        })

        ins_right_y({
            "location",
        })

        ins_right_z({
            function()
                local current_line = vim.fn.line(".")
                local total_lines = vim.fn.line("$")
                local percent = math.floor((current_line / total_lines) * 100)

                if current_line == 1 then
                    return "Comienzo/%L"
                elseif current_line == total_lines then
                    return "Final/%L"
                elseif vim.o.scrolloff == 0 then
                    return "Todo/%L"
                else
                    return percent .. "%%/%L"
                end
            end,
        })

        require("lualine").setup(config)
    end,
}
