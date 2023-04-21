return {
  "ahmedkhalf/project.nvim",
  event = "VimEnter",
  cmd = "Telescope projects",
  config = function()
    require("plugins.project.config").setup()
  end
}
