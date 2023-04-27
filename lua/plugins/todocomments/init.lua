 return {
     "folke/todo-comments.nvim",
     dependencies = {
         "nvim-lua/plenary.nvim",
     },
     event = "VeryLazy",
     lazy = true,
     cmd = { "TodoTrouble", "TodoTelescope", "TodoQuickFix" },
     keys = {
         {
             "]t",
             function()
                 require("todo-comments").jump_next()
             end,
             desc = "Jump to next TODO",
         },
         {
             "[t",
             function()
                 require("todo-comments").jump_prev()
             end,
             desc = "Jump to prev TODO",
         },
     },
     config = function()
         require("plugins.todocomments.config").setup()
     end,
 }
