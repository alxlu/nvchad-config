---@type MappingsTable
local M = {}

M.disabled = {
  i = {
    ["<C-h>"] = "",
    ["<C-l>"] = "",
    ["<C-j>"] = "",
    ["<C-k>"] = "",
  },
  n = {
    ["<leader>ls"] = "",
    ["<leader>lf"] = "",
    ["<leader>h"] = "",
  }
}

M.general = {
  i = {
    ["<Up>"] = { "<Nop>", "noop" },
    ["<Down>"] = { "<Nop>", "noop" },
  },
  n = {
    -- [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["QQ"] = { "<cmd> quitall! <CR>", "quit all without save" },
    ["WW"] = { "<cmd> quit <CR>", "quit window without save" },
    ["gs"] = { "<cmd> G <CR>", "vim fugitive git status"},
    ["<leader>fd"] = { "<cmd> Oil --float . <CR>", "open oil in float in current dir"},
    ["-"] = { "<cmd> Oil . <CR>", "open oil in current dir"},
    ["<leader>K"] = {
      function()
        vim.diagnostic.open_float { border = "rounded" }
      end,
      "lsp floating diagnostic",
    },
  },
  v = {
    [">"] = { ">gv", "indent" },
    -- [";"] = { ":", "command mode", opts = { nowait = true } },
    ["QQ"] = { "<cmd> quitall! <CR>", "quit all without save" },
    ["WW"] = { "<cmd> quit <CR>", "quit window without save" },
  },
}

-- more keybinds!

return M
