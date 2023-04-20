local M = {}

function M.setup()
    local notify = require "notify"
    -- this for transparency
    notify.setup { background_colour = "#242424" }
    -- this overwrites the vim notify function
    vim.notify = notify.notify
end

return M
