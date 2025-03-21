-- Basic options
vim.opt.clipboard = "unnamedplus"
vim.opt.ignorecase = true
vim.opt.smartcase = true
--
-- Reduce updatetime for faster response
vim.opt.updatetime = 100

-- Disable unnecessary features
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

-- Disable UI elements not needed in VSCode
vim.opt.showmode = false
vim.opt.showcmd = false
vim.opt.ruler = false

-- Disable syntax highlighting (VSCode handles this)
vim.cmd("syntax off")
-- Setup lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Try using LazyVim with VSCode extra
require("lazy").setup({
  { "LazyVim/LazyVim", import = "lazyvim.plugins" },
  { import = "lazyvim.plugins.extras.vscode" },
}, {
  ui = { border = "rounded" },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
-- Fix Space key interpretation
vim.api.nvim_set_keymap("", "<Space>", "<Space>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Space>", "<Space>", { noremap = true })
vim.api.nvim_set_keymap("v", "<Space>", "<Space>", { noremap = true })

-- Set Space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- VSCode-specific keymaps
vim.keymap.set("n", "gd", '<Cmd>call VSCodeNotify("editor.action.revealDefinition")<CR>')
vim.keymap.set("n", "gr", '<Cmd>call VSCodeNotify("editor.action.goToReferences")<CR>')
vim.keymap.set("n", "K", '<Cmd>call VSCodeNotify("editor.action.showHover")<CR>')
vim.keymap.set("n", "<Space>", '<Cmd>call VSCodeNotify("whichkey.show")<CR>', { noremap = true, silent = true })
vim.keymap.set("x", "<Space>", '<Cmd>call VSCodeNotify("whichkey.show")<CR>', { noremap = true, silent = true })
vim.keymap.set("n", "<Space>ca", '<Cmd>call VSCodeNotify("workbench.panel.aichat")<CR>')
