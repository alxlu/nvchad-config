local M = {}

M.general = {
  n = {
    [";"] = { ":", "command mode", opts = { nowait = true } },
    ["QQ"] = {"<cmd> quitall! <CR>", "quit all without save"}
  },
  v = {
    [";"] = { ":", "command mode", opts = { nowait = true } },
    ["QQ"] = {"<cmd> quitall! <CR>", "quit all without save"}
  }

}

return M
