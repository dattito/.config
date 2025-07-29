local wezterm = require("wezterm")
local act = wezterm.action

function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return "Catppuccin Mocha"
	else
		return "Catppuccin Latte"
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
	window_decorations = "RESIZE",
	audible_bell = "Disabled",

	window_background_opacity = 0.93,
	macos_window_background_blur = 32,

	window_padding = {
		top = 5,
		right = 5,
		left = 5,
		bottom = 5,
	},

	font = wezterm.font("FiraCode Nerd Font"),
	font_size = 14.0,

	max_fps = 80,

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

	mouse_bindings = {
		{
			event = { Up = { streak = 1, button = "Left" } },
			mods = "NONE",
			action = act.CompleteSelection("ClipboardAndPrimarySelection"),
		},
		{
			event = { Up = { streak = 1, button = "Left" } },
			mods = "NONE",
			action = act.CompleteSelection("PrimarySelection"),
		},

		-- and make CTRL-Click open hyperlinks
		{
			event = { Up = { streak = 1, button = "Left" } },
			mods = "CTRL",
			action = act.OpenLinkAtMouseCursor,
		},

		-- Disable the 'Down' event of CTRL-Click to avoid weird program behaviors
		{
			event = { Down = { streak = 1, button = "Left" } },
			mods = "CTRL",
			action = act.Nop,
		},
	},
	initial_cols = 150,
	initial_rows = 50,
}
