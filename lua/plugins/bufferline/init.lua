return {
  "akinsho/bufferline.nvim",
  -- event = "User FileOpened",
  opts = function()
    return require("plugins.bufferline.opts")
  end,
  config = function(_, opts)
    local status_ok, buffer_line = pcall(require, "bufferline")
    if not status_ok then
      return
    end
    buffer_line.setup(opts)
  end,
}
