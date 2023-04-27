return {
  "echasnovski/mini.comment",
  event = "VeryLazy",
  opts = {
    options = {
      -- Whether to ignore blank lines
      ignore_blank_line = true,

      -- Whether to recognize as comment only lines without indent
      start_of_line = true,

      -- Whether to ensure single space pad for comment parts
      pad_comment_parts = true,
    },

    -- Module mappings. Use `''` (empty string) to disable one.
    mappings = {
      -- Toggle comment (like `gcip` - comment inner paragraph) for both
      -- Normal and Visual modes
      comment = '<leader>/',

      -- Toggle comment on current line
      comment_line = '<leader>/',

      -- Define 'comment' textobject (like `dgc` - delete whole comment block)
      textobject = 'gc',
    },
    hooks = {
      pre = function()
        require("ts_context_commentstring.internal").update_commentstring({})
      end,
    },
  },
  config = function(_, opts)
    require("mini.comment").setup(opts)
  end,
}
