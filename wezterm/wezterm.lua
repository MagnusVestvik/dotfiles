-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

config.font_size = 16

config.use_fancy_tab_bar = true

config.color_scheme = 'Catppuccin Mocha (Gogh)'

config.window_background_opacity = 0.7
config.macos_window_background_blur = 50

config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_right_alt_is_pressed = true

-- and finally, return the configuration to wezterm
return config
