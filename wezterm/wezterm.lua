-- Pull in the wezterm API
local wezterm = require 'wezterm'
local mux = wezterm.mux
local hyprlink = require('enablehyprlinks')
local tab_bar = require('bar')
local general = require('general')
local keybinds = require('keybinds')

-- This will hold the configuration.
local config = wezterm.config_builder()

-- plugins
local modal = wezterm.plugin.require("https://github.com/MLFlexer/modal.wezterm")
modal.apply_to_config(config)
modal.set_default_keys(config)

local workspace_switcher = wezterm.plugin.require("https://github.com/MLFlexer/smart_workspace_switcher.wezterm")

keybinds.setup_keybinds(config, workspace_switcher, wezterm)
general.setup_general_settings(config)
tab_bar.setup_tab_bar(config)
hyprlink.enable_hyprlinks(config, wezterm)


wezterm.on("smart_workspace_switcher.workspace_switcher.created", function(window, workspace)
    wezterm.log_info("THIS IS EMITTED FROM THE CALLBACK")
    window:spawn_tab {}:set_title("GIT")
    window:spawn_tab {}:set_title("General")
end)

workspace_switcher.apply_to_config(config)

config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_right_alt_is_pressed = true

config.key_tables = modal.key_tables
wezterm.on("update-right-status", function(window, _)
    modal.set_right_status(window)
end)
-- and finally, return the configuration to wezterm
return config
