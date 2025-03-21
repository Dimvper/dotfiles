-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
  -- disable trouble
  { "folke/trouble.nvim", enabled = false },

  -- add more treesitter parsers
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
      },
    },
  },

  -- since `vim.tbl_deep_extend`, can only merge tables and not lists, the code above
  -- would overwrite `ensure_installed` with the new value.
  -- If you'd rather extend the default config, use the code below instead:
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- add tsx and treesitter
      vim.list_extend(opts.ensure_installed, {
        "tsx",
        "typescript",
      })
    end,
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

  -- add csharp configuration
  {
    "iabdelkareem/csharp.nvim",
    dependencies = {
      "williamboman/mason.nvim", -- Required, automatically installs omnisharp
      "mfussenegger/nvim-dap",
      "Tastyep/structlog.nvim", -- Optional, but highly recommended for debugging
    },
    config = function()
      require("mason").setup() -- Mason setup must run before csharp, only if you want to use omnisharp
      require("csharp").setup()
    end,
  },
  { "AndreM222/copilot-lualine" },
  {
    "giuxtaposition/blink-cmp-copilot",
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = false,
          auto_trigger = true,
          hide_during_completion = true,
          debounce = 75,
          keymap = {
            accept = "<M-l>",
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
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = true,
  },
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  { "rose-pine/neovim", name = "rose-pine" },
  { "nyoom-engineering/oxocarbon.nvim" },
  { "sainnhe/gruvbox-material" },
  { "whatyouhide/vim-gotham" },
  { "shaunsingh/nord.nvim" },
  { "shortcuts/no-neck-pain.nvim", version = "*" },
  -- Lua
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
      colorscheme = "nord",
    },
  },
}
