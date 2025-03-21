-- bootstrap lazy.nvim, LazyVim and your plugins
-- Detect if running in VSCode
if vim.g.vscode then
  -- Load VSCode-specific configuration
  require("config.vscode")
else
  -- Load regular LazyVim configuration for terminal use
  require("config.lazy")
end
