---@type MappingsTable
local M = {}

M.disabled = {
  i = {
    ["<C-h>"] = nil,
    ["<C-l>"] = nil,
    ["<C-j>"] = nil,
    ["<C-k>"] = nil,
  },
}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["QQ"] = { "<cmd> quitall! <CR>", "quit all without save" },
    ["WW"] = { "<cmd> quit <CR>", "quit all without save" },
  },
  v = {
    [">"] = { ">gv", "indent" },
    [";"] = { ":", "command mode", opts = { nowait = true } },
    ["QQ"] = { "<cmd> quitall! <CR>", "quit all without save" },
    ["WW"] = { "<cmd> quit <CR>", "quit all without save" },
  },
}

-- more keybinds!

return M
