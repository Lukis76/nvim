return {
  "vimwiki/vimwiki",
  cmd = { "VimwikiIndex" },
  init = function()
    vim.g.vimwiki_list = {{
      path = "~/.config/nvim/lua/lucas/wiki",
      syntax = "markdown",
      ext = ".md",
    }}
    vim.g.vimwiki_global_ext = 0
  end,
}