local M = {}

local opts = {
    theme = 'doom',
    config = {
        header = {}, --your header
        center = {
            {
                icon = ' ',
                icon_hl = 'Title',
                desc = 'Find File           ',
                desc_hl = 'String',
                key = 'b',
                keymap = 'SPC f f',
                key_hl = 'Number',
                action = 'lua print(2)'
            },
            {
                icon = ' ',
                desc = 'Find Dotfiles',
                key = 'f',
                keymap = 'SPC f d',
                action = 'lua print(3)'
            },
        },
        footer = {} --your footer
    }
}

local dashboard_custom_header7= {
    [[]],
    [[    ⢰⣧⣼⣯⠄⣸⣠⣶⣶⣦⣾⠄⠄⠄⠄⡀⠄⢀⣿⣿⠄⠄⠄⢸⡇⠄⠄ ]],
    [[    ⣾⣿⠿⠿⠶⠿⢿⣿⣿⣿⣿⣦⣤⣄⢀⡅⢠⣾⣛⡉⠄⠄⠄⠸⢀⣿⠄ ]],
    [[   ⢀⡋⣡⣴⣶⣶⡀⠄⠄⠙⢿⣿⣿⣿⣿⣿⣴⣿⣿⣿⢃⣤⣄⣀⣥⣿⣿⠄ ]],
    [[   ⢸⣇⠻⣿⣿⣿⣧⣀⢀⣠⡌⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⠿⣿⣿⣿⠄ ]],
    [[  ⢀⢸⣿⣷⣤⣤⣤⣬⣙⣛⢿⣿⣿⣿⣿⣿⣿⡿⣿⣿⡍⠄⠄⢀⣤⣄⠉⠋⣰ ]],
    [[  ⣼⣖⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⢇⣿⣿⡷⠶⠶⢿⣿⣿⠇⢀⣤ ]],
    [[ ⠘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣽⣿⣿⣿⡇⣿⣿⣿⣿⣿⣿⣷⣶⣥⣴⣿⡗ ]],
    [[ ⢀⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟  ]],
    [[ ⢸⣿⣦⣌⣛⣻⣿⣿⣧⠙⠛⠛⡭⠅⠒⠦⠭⣭⡻⣿⣿⣿⣿⣿⣿⣿⣿⡿⠃  ]],
    [[ ⠘⣿⣿⣿⣿⣿⣿⣿⣿⡆⠄⠄⠄⠄⠄⠄⠄⠄⠹⠈⢋⣽⣿⣿⣿⣿⣵⣾⠃  ]],
    [[  ⠘⣿⣿⣿⣿⣿⣿⣿⣿⠄⣴⣿⣶⣄⠄⣴⣶⠄⢀⣾⣿⣿⣿⣿⣿⣿⠃   ]],
    [[   ⠈⠻⣿⣿⣿⣿⣿⣿⡄⢻⣿⣿⣿⠄⣿⣿⡀⣾⣿⣿⣿⣿⣛⠛⠁    ]],
    [[     ⠈⠛⢿⣿⣿⣿⠁⠞⢿⣿⣿⡄⢿⣿⡇⣸⣿⣿⠿⠛⠁      ]],
    [[        ⠉⠻⣿⣿⣾⣦⡙⠻⣷⣾⣿⠃⠿⠋⠁     ⢀⣠⣴ ]],
    [[ ⣿⣿⣿⣶⣶⣮⣥⣒⠲⢮⣝⡿⣿⣿⡆⣿⡿⠃⠄⠄⠄⠄⠄⠄⠄⣠⣴⣿⣿⣿ ]],
    [[]],
}

local header = function (dashboard)
    dashboard.section.header.val = dashboard_custom_header7
end

local buttons = function (dashboard)
    local icons = require("lucas.icons")
    dashboard.section.buttons.val = {
        dashboard.button( "n", icons.ui.NewFile .. "  New file" , "<CMD>ene!<CR>"),
        dashboard.button( "f", icons.ui.FindFile .. "  Find File", "<CMD>Telescope find_files<CR>"),
        dashboard.button( "p", icons.ui.Project .. "  Projects ", "<CMD>Telescope projects<CR>"),
        dashboard.button( "r", icons.ui.History .. "  Recent files", ":Telescope oldfiles <CR>"),
        dashboard.button( "t", icons.ui.FindText .. "  Find Text", "<CMD>Telescope live_grep<CR>"),
        -- dashboard.button( "c", icons.ui.Gear .. "  Configuration","<CMD>edit " .. require("lvim.config"):get_user_config_path() .. " <CR>),
        dashboard.button( "q", icons.ui.Close .. "  Quit", "<CMD>quit<CR>"),
    }
end

function M.setup()
    -- require('dashboard').setup(opts)
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    header(dashboard)

    buttons(dashboard)

    require('alpha').setup(dashboard.config)

end

return M
