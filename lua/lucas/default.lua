local M = {}


function M:init()
    Default = {
        plugins = {
            bufferLine = true,
            tree = true
        },
        icons = require("lucas.icons")
    }
end

return M

