---@type ChadrcConfig
local M = {}

M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

M.ui = {
  theme = "catppuccin",
  theme_toggle = { "catppuccin", "one_light" },
  transparency = true,

  -- nvdash = {
  --   load_on_startup = true,
  -- },

  statusline = {
    theme = "vscode",
  },
  tabufline = {
    enabled = true,
  },
  extended_integrations = { "alpha", "notify", "todo", "rainbowdelimiters", "codeactionmenu" },
}

return M
