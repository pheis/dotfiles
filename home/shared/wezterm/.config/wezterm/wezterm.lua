local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.window_decorations = "TITLE | RESIZE"
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = false
config.show_new_tab_button_in_tab_bar = false
config.use_fancy_tab_bar = false
config.window_background_opacity = 1.0

config.font = wezterm.font("FiraMono nerd font", { weight = "Regular" })
config.font_size = 16.0

config.keys = require("keys")

config.colors = require("my-colors")

return config
