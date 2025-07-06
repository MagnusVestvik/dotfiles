local keybinds = {}

function keybinds.setup_keybinds(config, workspace_switcher, wezterm)
    config.keys = {
        {
            key = "e",
            mods = "CTRL",
            action = workspace_switcher.switch_workspace(),
        },
        {
            key = "t",
            mods = "CTRL",
            action = wezterm.action.SpawnTab "CurrentPaneDomain"
        },
        {
            key = "w",
            mods = "CTRL",
            action = wezterm.action.CloseCurrentTab { confirm = true },
        },
        {
            key = "1",
            mods = "CTRL",
            action = wezterm.action.ActivateTab(0),
        },
        {
            key = "2",
            mods = "CTRL",
            action = wezterm.action.ActivateTab(1),
        },
        {
            key = "3",
            mods = "CTRL",
            action = wezterm.action.ActivateTab(2),
        },
        {
            key = "e",
            mods = "ALT",
            action = wezterm.action.ShowTabNavigator,
        },
    }
end

return keybinds
