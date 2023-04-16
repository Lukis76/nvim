return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-lua/popup.nvim" },
		{ "nvim-telescope/telescope-fzy-native.nvim" },
		{ "kyazdani42/nvim-web-devicons" },
		{ "nvim-telescope/telescope-file-browser.nvim" },
		{ "nvim-telescope/telescope-ui-select.nvim" },
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			dependencies = {
				"junegunn/fzf.vim",
				dependencies = {
					{
						"tpope/vim-dispatch",
						cmd = { "Make", "Dispatch" },
					},
				},
			},
		},
	},
	event = "VeryLazy",
	config = function()
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>fp", builtin.find_files, {})
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
		vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

    local config = {
      defaults = {
      prompt_prefix = "❯ ",
      selection_caret = "❯ ",

      winblend = 0,

      layout_strategy = "horizontal",
      layout_config = {
        width = 0.95,
        height = 0.85,
        -- preview_cutoff = 120,
        prompt_position = "bottom",

        horizontal = {
          preview_width = function(_, cols, _)
            if cols > 200 then
              return math.floor(cols * 0.5)
            else
              return math.floor(cols * 0.6)
            end
          end,
        },

        vertical = {
          width = 0.95,
          height = 0.95,
          preview_height = 0.5,
        },

        flex = {
          horizontal = {
            preview_width = 0.9,
          },
        },
      },
      selection_strategy = "reset",
      sorting_strategy = "descending",
      scroll_strategy = "cycle",
      color_devicons = true,
    }
  }
      require("telescope").setup(config)
	end,
}
