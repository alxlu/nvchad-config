-- First read our docs (completely) then check the example_config repo

local M = {}

M.ui = {
  theme = "tomorrow_night",
  theme_toggle = { "tomorrow_night", "blossom" },
}

M.plugins = require "custom.plugins"
M.mappings = require "custom.mappings"

return M
