return {
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-treesitter/nvim-treesitter-textobjects",
      "nvim-cmp",
    },
    config = function()
      require("neorg").setup({
        load = {
          ["core.defaults"] = {}, -- Loads default behaviour
          ["core.completion"] = { config = { engine = "nvim-cmp", name = "[Norg]" } },
          ["core.integrations.nvim-cmp"] = {},
          ["core.concealer"] = { config = { icon_preset = "diamond" } },
          ["core.export"] = {},
          ["core.keybinds"] = {
            -- https://github.com/nvim-neorg/neorg/blob/main/lua/neorg/modules/core/keybinds/keybinds.lua
            config = {
              default_keybinds = true,
              neorg_leader = "<Leader>n",
            },
          },
          ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                notes = "~/Library/Mobile Documents/com~apple~CloudDocs/neorg/notes",
              },
            },
          },
        },
      })
    end,
  },
  {
    "epwalsh/obsidian.nvim",
    lazy = true,
    event = {
      -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
      -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
      "BufReadPre \"~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Notes/*/**.md\"",
      "BufNewFile \"~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Notes/*/**.md\"",
    },
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",

      -- see below for full list of optional dependencies 👇
    },
    opts = {
      workspaces = {
        {
          name = "Notes",
          path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Notes",
        }
      },

      -- see below for full list of options 👇
    },
  },
}
