return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  dependencies = {
    "nvim-treesitter/playground",
    "nvim-treesitter/nvim-treesitter-refactor",
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  config = function()
    require("nvim-treesitter.configs").setup {
      ensure_installed = {
        "bash",
        "css",
        "go",
        "gomod",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "nix",
        "php",
        "phpdoc",
        "query",
        "rust",
        "svelte",
        "typescript",
        "vim",
        "yaml",
        "org",
      },
      -- Habilita el resaltado de sintaxis mediante Treesitter.
      -- Además, se especifica una función que desactiva el resaltado
      -- para archivos grandes o para el lenguaje LaTeX.
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { "org" },
      },
      incremental_selection = {
        enable = false,
        keymaps = {
          init_selection = "gnn",
          node_incremental = "grn",
          scope_incremental = "grc",
          node_decremental = "grm",
        },
      },
      refactor = {
        highlight_definitions = { enable = true },
        smart_rename = {
          enable = false,
          keymaps = {
            smart_rename = "trr",
          },
        },
      },
      -- Habilita la inserción automática de comentarios para los 
      -- lenguajes especificados, utilizando los patrones de comentarios definidos.
      context_commentstring = {
        enable = true,
        enable_autocmd = false,
        config = {
          -- Languages that have a single comment style
          typescript = "// %s",
          css = "/* %s */",
          scss = "/* %s */",
          html = "<!-- %s -->",
          svelte = "<!-- %s -->",
          vue = "<!-- %s -->",
          json = "",
        },
      },
      -- Habilita la indentación automática basada en la estructura 
      -- del árbol de sintaxis del lenguaje. Se desactiva para los
      -- lenguajes YAML y Python.
      indent = { enable = true, disable = { "yaml", "python" } },
      -- Desactiva la autocompletado de etiquetas HTML.
      autotag = { enable = true },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@conditional.outer",
            ["ic"] = "@conditional.inner",
            ["al"] = "@loop.outer",
            ["il"] = "@loop.inner",
          },
        },
      },
      playground = {
        enable = true,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false, -- Whether the query persists across vim sessions
        keybindings = {
          toggle_query_editor = "o",
          toggle_hl_groups = "i",
          toggle_injected_languages = "t",
          toggle_anonymous_nodes = "a",
          toggle_language_display = "I",
          focus_language = "f",
          unfocus_language = "F",
          update = "R",
          goto_node = "<cr>",
          show_help = "?",
        },
      },
      -- Habilita la resaltado de pares de delimitadores, 
      -- como paréntesis, corchetes y llaves. El modo extendido 
      -- incluirá otros delimitadores como comillas, comillas dobles, etc.
      rainbow = {
        enable = true,
        extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
        max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
      },
    }
  end,
}
