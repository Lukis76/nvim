return {
     'goolord/alpha-nvim',
     event = "VimEnter",
     config = function ()
         require("plugins.dashboard.config").setup()
     end

 }
