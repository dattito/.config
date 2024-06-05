local wezterm = require("wezterm")

return {
	tab_bar_at_bottom = true,
	hide_tab_bar_if_only_one_tab = true,
	window_decorations = "RESIZE",

	window_background_opacity = 0.93,
	macos_window_background_blur = 32,

	font = wezterm.font("FiraCode Nerd Font"),
	font_size = 14.0,

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
