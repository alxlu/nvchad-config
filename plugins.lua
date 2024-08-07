local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local opts = require "plugins.configs.cmp"
      local cmp = require "cmp"
      opts.mapping["<C-j>"] = cmp.mapping.select_next_item()
      opts.mapping["<C-k>"] = cmp.mapping.select_prev_item()
      opts.mapping["<Down>"] = cmp.mapping.select_next_item()
      opts.mapping["<Up>"] = cmp.mapping.select_prev_item()
      return opts
    end,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    "tpope/vim-fugitive",
    cmd = { "G" },
  },
  {
    "tpope/vim-surround",
    lazy = false,
  },
  {
    "David-Kunz/gen.nvim",
    cmd = { "Gen" },
    opts = {
      model = "zephyr:7b", -- The default model to use.
      display_mode = "split", -- The display mode. Can be "float" or "split".
      show_prompt = true, -- Shows the Prompt submitted to Ollama.
      show_model = true, -- Displays which model you are using at the beginning of your chat session.
      no_auto_close = false, -- Never closes the window automatically.
      init = function()
        pcall(io.popen, "echo skipped")
      end,
      -- Function to initialize Ollama
      command = "curl --silent --no-buffer -X POST http://localhost:11434/api/generate -d $body",
      -- The command for the Ollama service. You can use placeholders $prompt, $model and $body (shellescaped).
      -- This can also be a lua function returning a command string, with options as the input parameter.
      -- The executed command must return a JSON object with { response, context }
      -- (context property is optional).
      list_models = "<function>", -- Retrieves a list of model names
      debug = false, -- Prints errors and the command which is run.
    },
  },
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen" },
  },
  {
    "jinh0/eyeliner.nvim",
    config = function()
      require("eyeliner").setup {
        highlight_on_key = true,
        dim = true,
      }
    end,
    lazy = false,
  },
  {
    "ThePrimeagen/harpoon",
    config = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>;", "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "Mark file with harpoon" },
      { "<leader>mj", "<cmd>lua require('harpoon.ui').nav_next()<cr>", desc = "Go to next harpoon mark" },
      { "<leader>mk", "<cmd>lua require('harpoon.ui').nav_prev()<cr>", desc = "Go to previous harpoon mark" },
      { "<leader>mb", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Show harpoon marks" },
      { "<leader>:", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Show harpoon marks" },
      { "<leader>h", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", desc = "harpoon 1" },
      { "<leader>j", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", desc = "harpoon 2" },
      { "<leader>k", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", desc = "harpoon 3" },
      { "<leader>l", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", desc = "harpoon 4" },
    },
  },
  {
    "stevearc/oil.nvim",
    opts = {},
    cmd = { "Oil" },
    lazy = false,
    config = function()
      require("oil").setup {
        keymaps = {
          ["<C-h>"] = false,
          ["<C-l>"] = false,
          ["g;"] = "actions.open_terminal",
          ["gs"] = false,
        },
      }
    end,
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
