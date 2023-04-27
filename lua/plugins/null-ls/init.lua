return {
  "jose-elias-alvarez/null-ls.nvim",
  config = function()
    local status_ok, null_ls = pcall(require, "null-ls")
    if status_ok then
      local format = null_ls.builtins.formatting
      local diagnostic = null_ls.builtins.diagnostics
      local code_action = null_ls.builtins.code_actions
      null_ls.setup({
        sources = {
          debug = false,
          -- null_ls.builtins.code_actions.gitsigns,
          format.prettier,
          format.stylua,
          format.alejandra,
          diagnostic.eslint,
          diagnostic.luacheck,
          code_action.refactoring,
        }
      })
    end
  end
}
