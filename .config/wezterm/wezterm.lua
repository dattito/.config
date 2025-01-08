local wezterm = require("wezterm")

function scheme_for_appearance(appearance)
  if appearance:find 'Dark' then
    return 'Catppuccin Mocha'
  else
    return 'Catppuccin Latte'
  end
end

-- -- Change theme depending on dark- or light-mode
-- wezterm.on('window-config-reloaded', function(window, pane)
--   local overrides = window:get_config_overrides() or {}
--   local appearance = window:get_appearance()
--   local scheme = scheme_for_appearance(appearance)
--   if overrides.color_scheme ~= scheme then
--     overrides.color_scheme = scheme
--     window:set_config_overrides(overrides)
--   end
-- end)

return {
  tab_bar_at_bottom = true,
  hide_tab_bar_if_only_one_tab = true,
  window_decorations = "NONE",
  audible_bell = "Disabled",

  window_background_opacity = 0.93,
  macos_window_background_blur = 32,

  font = wezterm.font("FiraCode Nerd Font"),
  font_size = 14.0,

  max_fps = 120,

  color_scheme = "catppuccin-mocha",

  use_dead_keys = false,
  send_composed_key_when_left_alt_is_pressed = true,
  use_ime = true,

  window_close_confirmation = "NeverPrompt",
  keys = {
    {
      key = "n",
      mods = "OPT",
      action = wezterm.action({ SendString = "~" }),
    },
  },
}
