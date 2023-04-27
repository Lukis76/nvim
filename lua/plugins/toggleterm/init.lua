 return {
     'akinsho/toggleterm.nvim',
     version = "*",
     init = function ()
         require("plugins.toggleterm.config").init()
     end,
     config = function()
         require("plugins.toggleterm.config").setup()
     end
 }
