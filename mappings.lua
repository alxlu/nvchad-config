---@type MappingsTable
local M = {}

M.disabled = {
  i = {
    ["<C-h>"] = "",
    ["<C-l>"] = "",
    ["<C-j>"] = "",
    ["<C-k>"] = "",
  },
}

M.general = {
  i = {
    ["<Up>"] = { "<Nop>", "noop" },
    ["<Down>"] = { "<Nop>", "noop" },
  },
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
