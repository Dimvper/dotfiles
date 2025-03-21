local M = {
  "nvim-neorg/neorg",
  ft = "norg",
  lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
  version = "*", -- Pin Neorg to the latest stable release
  config = true,
  dependencies = {
    "nvim-neorg/lua-utils.nvim",
    "pysan3/pathlib.nvim",
    "nvim-neotest/nvim-nio",
    "nvim-treesitter/nvim-treesitter",
    "nvim-lua/plenary.nvim",
  },
  cmd = "Neorg",
}

local modules = {
  ["core.defaults"] = {},
  ["core.concealer"] = { config = { icon_preset = "diamond" } },
  ["core.keybinds"] = {
    config = {
      default_keybinds = true,
      neorg_leader = "<Leader>N",
    },
  },
  ["core.dirman"] = {
    config = {
      workspaces = {
        Notes = "~/Nextcloud/Notes",
        Work = "~/Nextcloud/Work",
      },
      default_workspace = "Work",
    },
  },
}
M.opts = {
  load = modules,
}
return M
