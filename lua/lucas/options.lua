local g = vim.g
local opt = vim.o

-- g.netrw_banner = 0
-- g.nvim_tree_disable_default_keybindings = 1
g.nvim_tree_auto_close = 1
opt.showtabline = 2

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

g.mapleader = " "
g.snippets = "luasnip"



opt.cursorline = true   -- resaltadode la linea dondes esta el cursor
-- opt.winbar = "%=%f"
opt.mouse = "a"   -- podemos habilitar el el mouse o desabilitar
opt.number = true   --numero de linea en el left de la window
opt.relativenumber = true    -- numero de linea con respepecto al la posocion del cursor
opt.conceallevel = 3
opt.hidden = true   --impoertantes para que las terminales guarden el estado al cerrarlas
opt.expandtab = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.smartindent = true
opt.errorbells = false
opt.wrap = false
opt.swapfile = false
opt.undofile = true
-- opt.undodir = os.getenv("HOME") .. "/.cache/nvim/undodir"
opt.hlsearch = false
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.termguicolors = true
opt.scrolloff = 4
opt.sidescrolloff = 4
opt.showmode = false
opt.clipboard = "unnamedplus"
opt.splitbelow = true
opt.splitright = true
opt.autowrite = true
opt.list = true
opt.listchars = "tab:\\ ,trail:-"
opt.laststatus = 3
opt.cmdheight = 1
opt.updatetime = 50
opt.signcolumn = "yes"

-- if vim.fn.has("nvim-0.9.0") == 1 then
opt.splitkeep = "screen"
opt.shortmess = "filnxtToOFWIcC"
-- end
