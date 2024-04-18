local M = {}

local countPath = debug.getinfo(1).source:match("@?(.*/)") .. "count.lua"
local input = vim.fn.getcwd() .. "/" .. vim.fn.expand("%")

local command = "pandoc --lua-filter " .. countPath .. " ".. input

M.countWords = function()
 local handle = assert(io.popen(command))
 local output = handle:read("*a")
 output = output:gsub("\n", "")
 print(output)
 handle:close()
end

return M
