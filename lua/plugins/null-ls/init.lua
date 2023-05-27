return {
  "jose-elias-alvarez/null-ls.nvim",
  config = function()
    local status_ok, null_ls = pcall(require, "null-ls")
    if not status_ok then
      return {}
    end
    local format = null_ls.builtins.formatting
    local diagnostic = null_ls.builtins.diagnostics
    local code_action = null_ls.builtins.code_actions
    null_ls.setup({
      sources = {
        debug = false,
        -- null_ls.builtins.code_actions.gitsigns,
        format.prettier.with({
          extra_args = {
            "--print-with",
            "100",
          },
          filetypes = {
            "typescript",
            "typescriptreact",
            "javascript",
            "vue",
          },
        }),
        format.stylua,
        format.yamlfmt,
        format.alejandra,
--         format.semgrep,
        format.shfmt,
        format.beautysh,
        format.shellharden,

        --         Rust
        format.rustfmt.with({
          extra_args = {
            "--print-with",
            "100",
          },
          filetypes = {
            "rust",
          },
        }),
        format.pint,
        diagnostic.eslint,
        diagnostic.luacheck.with({
          extra_args = {
            "--print-with",
            "100",
          },
          filetypes = {
            "lua",
          },
        }),
        --           diagnostic.actionlint,
        code_action.refactoring,

        null_ls.builtins.diagnostics.phpstan.with({
          to_temp_file = false,
          method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
          command = "./bin/phpstan",
          condition = function()
            return vim.fn.findfile("bin/phpstan") ~= ""
          end,
        }),
        null_ls.builtins.diagnostics.phpcs.with({
          method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
          condition = function(utils)
            return utils.root_has_file("phpcs.xml")
          end,
        }),
        --           null_ls.builtins.formatting.pint,
      },
    })
  end,
}
