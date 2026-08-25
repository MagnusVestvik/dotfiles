-- Pull in the wezterm API
local wezterm = require 'wezterm'
local hyprlink = require('enablehyprlinks')
local tab_bar = require('bar')
local general = require('general')
local keybinds = require('keybinds')

-- This will hold the configuration.
local config = wezterm.config_builder()

-- workspace switcher
local workspace_switcher = wezterm.plugin.require("https://github.com/MLFlexer/smart_workspace_switcher.wezterm")
wezterm.on("smart_workspace_switcher.workspace_switcher.created", function (window, _)
	local nvim_tab = window:active_tab()
	nvim_tab:set_title("NVIM")
	window:spawn_tab {}:set_title("GIT")
	window:spawn_tab {}:set_title("General")
	nvim_tab:activate()
end)

workspace_switcher.apply_to_config(config)

-- tabline
local bar = wezterm.plugin.require("https://github.com/adriankarlen/bar.wezterm")
bar.apply_to_config(config)

-- Setup of other configs
keybinds.setup_keybinds(config, workspace_switcher, wezterm)
general.setup_general_settings(config)
tab_bar.setup_tab_bar(config)
hyprlink.enable_hyprlinks(config, wezterm)

-- TODO: Should find out what this does
config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_right_alt_is_pressed = true

config.color_scheme = "Noctalia"
return config
