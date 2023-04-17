-- local filename = vim.fn.expand("%:t:r")
-- local customname = filename.gsub("^%l", string.upper)

-- return {
-- 	s(
-- 		"facho",
-- 		fmt(
-- 			[[
-- type T {} = {
--   cts: string
-- }
-- export const {}: FC = () => {{
--   return (
--     <div>
--       {}
--     </div>
--   )
-- }}
-- ]],
-- 			{ i(1, "lukas"), i(2, "lukas"), i(3, "lukas") }
-- 		)
-- 	),
-- }

local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets('lua', {
  s('h', t('Hello world!!! lucas'))
})