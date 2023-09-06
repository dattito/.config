---@type ChadrcConfig
local M = {}

M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

M.ui = {
  theme = "catppuccin",
  transparency = false,

  -- nvdash = {
  --   load_on_startup = true,
  -- },

  statusline = {
    theme = "minimal",
  },
}

return M
