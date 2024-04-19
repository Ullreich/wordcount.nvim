local M = {}

local countPath = debug.getinfo(1).source:match("@?(.*/)") .. "count.lua"
local input = vim.fn.getcwd() .. "/" .. vim.fn.expand("%")
local extension = vim.fn.expand("%:e")

local mdCommand = "pandoc --lua-filter " .. countPath .. " ".. input
local texCommand = "texcount " .. input .. " -total"
local command = ""

M.countWords = function()
  --TODO: use metadata instead to check what filetype?
  if extension=="md" then
    command = mdCommand
  elseif extension=="tex" then
    command = texCommand
  else
    -- TODO: in this case break or something
    print("unsupported file format")
  end
  
  local handle = assert(io.popen(command))
  local output = handle:read("*a")
  handle:close()

  --postprocess output
  if extension=="md" then
    output = output:gsub("\n", "")
  elseif extension=="tex" then
    output = "Words in text: " .. (string.match(output, 'Words in text:%s*(%d[,.%d]*)'))
  end
 
  print(output)
end

return M
