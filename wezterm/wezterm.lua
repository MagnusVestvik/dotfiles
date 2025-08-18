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
local workspace_switcher = wezterm.plugin.require("https://github.com/MLFlexer/smart_workspace_switcher.wezterm")

keybinds.setup_keybinds(config, workspace_switcher, wezterm)
general.setup_general_settings(config)
tab_bar.setup_tab_bar(config)
hyprlink.enable_hyprlinks(config, wezterm)


wezterm.on("smart_workspace_switcher.workspace_switcher.created", function(window, workspace)
    local nvim_tab = window:active_tab()
    nvim_tab:set_title("NVIM")
    window:spawn_tab {}:set_title("GIT")
    window:spawn_tab {}:set_title("General")
    nvim_tab:activate()
end)

workspace_switcher.apply_to_config(config)

config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_right_alt_is_pressed = true

-- and finally, return the configuration to wezterm
return config
