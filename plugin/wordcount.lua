-- local h = require("wordcount.hello")
local count = require("wordcount.countWrapper")


vim.api.nvim_create_user_command("Wordcount", function()
  count.countWords()
end, {})
