---@type ChadrcConfig
local M = {}

M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

M.ui = {
  theme = "catppuccin",
  theme_toggle = { "catppuccin", "one_light" },
  transparency = false,

  -- nvdash = {
  --   load_on_startup = true,
  -- },

  statusline = {
    theme = "minimal",
  },
  -- tabufline = {
  --   enabled = false,
  -- },
}

return M
