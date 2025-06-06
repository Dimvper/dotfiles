-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
  -- disable trouble
  { "folke/trouble.nvim", enabled = false },

  -- { "nvim-neo-tree/neo-tree.nvim", enabled = true },
  --
  -- {
  --   "echasnovski/mini.nvim",
  --   lazy = false,
  --   version = "*",
  --   config = function()
  --     require("mini.surround").setup({
  --       -- Configuration here, or leave empty to use defaults
  --     })
  --   end,
  -- },

  {
    "echasnovski/mini.files",
    options = {
      use_as_default_explorer = true,
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "gdscript",
        "javascript",
        "json",
        "c_sharp",
        "cpp",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
        "tsx",
        "typescript",
      },
    },
  },
  -- add any tools you want to have installed below
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
      },
    },
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = true,
          auto_trigger = true,
          hide_during_completion = true,
          debounce = 75,
          keymap = {
            accept = "<C-l>",
            accept_word = false,
            accept_line = false,
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
          },
        },
        copilot_model = "gpt-4o-copilot",
      })
    end,
  },
  {
    "echasnovski/mini.surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("mini.surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
  },
  { "rose-pine/neovim", name = "rose-pine" },
  { "shaunsingh/nord.nvim" },

  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      direction = "horizontal",
      -- float_opts = {
      --   border = "curved",
      -- },
    },
    config = function(_, opts)
      require("toggleterm").setup(opts)

      function _G.set_terminal_keymaps()
        local opts_ = { buffer = 0 }
        vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts_)
        vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts_)
        vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts_)
        vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts_)
        vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts_)
      end

      vim.cmd("autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()")
    end,
    cmd = {
      "ToggleTerm",
      "ToggleTermToggleAll",
      "TermExec",
      "TermSelect",
      "ToggleTermSetName",
      "ToggleTermSendVisualLines",
      "ToggleTermSendVisualSelection",
      "ToggleTermSendCurrentLine",
    },
    keys = {
      { "<leader>t", "<cmd>ToggleTerm<cr>", desc = "Toggle [T]erminal" },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
}
