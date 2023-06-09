local icons = require("lucas.icons")
local M = {}

local opts = {
    auto_reload_on_write = false,
    disable_netrw = true,
    hijack_cursor = true,
    hijack_netrw = true,
    hijack_unnamed_buffer_when_opening = true,
    -- ignore_buffer_on_setup = false,
    sort_by = "name",
    root_dirs = {},
    prefer_startup_root = false,
    sync_root_with_cwd = true,
    reload_on_bufenter = false,
    respect_buf_cwd = false,
    on_attach = "disable",
    remove_keymaps = false,
    select_prompts = false,
    view = {
        adaptive_size = true,
        centralize_selection = false,
        width = 30,
        hide_root_folder = false,
        side = "left",
        preserve_window_proportions = false,
        number = false,
        relativenumber = false,
        signcolumn = "yes",
        mappings = {
            custom_only = false,
            list = {},
        },
        float = {
            enable = false,
            quit_on_focus_loss = true,
            open_win_config = {
                relative = "editor",
                border = "rounded",
                width = 30,
                height = 30,
                row = 1,
                col = 1,
            },
        },
    },
    renderer = {
        add_trailing = false,
        group_empty = false,
        highlight_git = true,
        full_name = false,
        highlight_opened_files = "none",
        highlight_modified = "none",
        root_folder_label = ":t",
        indent_width = 2,
        indent_markers = {
            enable = true,
            inline_arrows = true,
            icons = {
                corner = "└",
                edge = "│",
                item = "│",
                bottom = "─",
                none = " ",
            },
        },
        icons = {
            webdev_colors = true,
            git_placement = "before",
            padding = " ",
            symlink_arrow = icons.ui.BoldArrowRight,
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = true,
            },
            glyphs = {
                default = icons.ui.Text,
                symlink = icons.ui.FileSymlink,
                bookmark = icons.ui.BookMark,
                folder = {
                    arrow_closed = icons.ui.TriangleShortArrowRight,
                    arrow_open = icons.ui.TriangleShortArrowDown,
                    default = icons.ui.Folder,
                    open = icons.ui.FolderOpen,
                    empty = icons.ui.EmptyFolder,
                    empty_open = icons.ui.EmptyFolderOpen,
                    symlink = icons.ui.FolderSymlink,
                    symlink_open = icons.ui.FolderOpen,
                },
                git = {
                    unstaged = icons.git.FileUnstaged,
                    staged = icons.git.FileStaged,
                    unmerged = icons.git.FileUnmerged,
                    renamed = icons.git.FileRenamed,
                    untracked = icons.git.FileUntracked,
                    deleted = icons.git.FileDeleted,
                    ignored = icons.git.FileIgnored,
                },
            },
        },
        special_files = {}, -- { "Cargo.toml", "Makefile", "README.md", "readme.md" },
        symlink_destination = true,
    },
    -- hijack_directories = {
    --     enable = true,
    --     debounce_delay = 15,
    --     update_root = true,
    --     ignore_list = {},
    -- },
    -- update_focused_file = {
    --     enable = true,
    --     debounce_delay = 15,
    --     update_root = true,
    --     ignore_list = {},
    -- },
    diagnostics = {
        enable = true,
        show_on_dirs = false,
        show_on_open_dirs = true,
        debounce_delay = 50,
        severity = {
            min = vim.diagnostic.severity.HINT,
            max = vim.diagnostic.severity.ERROR,
        },
        icons = {
            hint = icons.diagnostics.BoldHint,
            info = icons.diagnostics.BoldInformation,
            warning = icons.diagnostics.BoldWarning,
            error = icons.diagnostics.BoldError,
        },
    },
    filters = {
        dotfiles = false,
        git_clean = false,
        no_buffer = false,
        custom = {},
        exclude = {},
    },
    filesystem_watchers = {
        enable = true,
        debounce_delay = 50,
        ignore_dirs = {},
    },
    git = {
        enable = true,
        ignore = false,
        show_on_dirs = true,
        show_on_open_dirs = true,
        timeout = 200,
    },
    actions = {
        use_system_clipboard = true,
        change_dir = {
            enable = true,
            global = false,
            restrict_above_cwd = false,
        },
        expand_all = {
            max_folder_discovery = 300,
            exclude = {},
        },
        file_popup = {
            open_win_config = {
                col = 1,
                row = 1,
                relative = "cursor",
                border = "shadow",
                style = "minimal",
            },
        },
        open_file = {
            quit_on_open = false,
            resize_window = false,
            window_picker = {
                enable = true,
                picker = "default",
                chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                exclude = {
                    filetype = { "notify", "lazy", "qf", "diff", "fugitive", "fugitiveblame" },
                    buftype = { "nofile", "terminal", "help" },
                },
            },
        },
        remove_file = {
            close_window = true,
        },
    },
    trash = {
        cmd = "trash",
        require_confirm = true,
    },
    live_filter = {
        prefix = "[FILTER]: ",
        always_show_folders = true,
    },
    tab = {
        sync = {
            open = false,
            close = false,
            ignore = {},
        },
    },
    notify = {
        threshold = vim.log.levels.INFO,
    },
    ui = {
        confirm = {
            remove = true,
            trash = true,
        },
    },
    experimental = {
        git = {
            async = false,
        },
    },
    log = {
        enable = false,
        truncate = false,
        types = {
            all = false,
            config = false,
            copy_paste = false,
            dev = false,
            diagnostics = false,
            git = false,
            profile = false,
            watcher = false,
        },
    },
    system_open = {
        cmd = "",
        args = {},
    },
}



function M.setup()
    require("nvim-tree").setup(opts)
end

return M
