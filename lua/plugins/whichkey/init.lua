 return {
     "folke/which-key.nvim",
     cmd = "WhichKey",
     event = "VeryLazy",
     config = function()
         require("plugins.whichkey.config").setup()
     end,
 }
