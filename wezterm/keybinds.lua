local keybinds = {}

function keybinds.setup_keybinds(config, workspace_switcher, wezterm)
	config.leader = { key = "b", mods = "CTRL", timeout_milliseconds = 1000 }
	config.keys = {
		{
			key = "e",
			mods = "CTRL",
			action = workspace_switcher.switch_workspace()
		},
		{
			key = "t",
			mods = "CTRL",
			action = wezterm.action.SpawnTab("CurrentPaneDomain")
		},
		{
			key = "1",
			mods = "CTRL",
			action = wezterm.action.ActivateTab(0)
		},
		{
			key = "2",
			mods = "CTRL",
			action = wezterm.action.ActivateTab(1)
		},
		{
			key = "3",
			mods = "CTRL",
			action = wezterm.action.ActivateTab(2)
		},
		{
			key = "e",
			mods = "ALT",
			action = wezterm.action.ShowTabNavigator
		},
		{
			key = "f",
			mods = "ALT",
			action = wezterm.action.ShowLauncherArgs({ flags = "FUZZY|DOMAINS" })
		},
		{
			key = "v",
			mods = "ALT",
			action = wezterm.action.SplitPane { direction = "Right", size = { Percent = 50 } }
		},
		{
			key = "h",
			mods = "ALT",
			action = wezterm.action.SplitPane { direction = "Down", size = { Percent = 50 } }
		},
		{
			key = "x",
			mods = "CTRL",
			action = wezterm.action.CloseCurrentPane { confirm = false }
		},
		{
			key = "s",
			mods = "ALT",
			action = wezterm.action.PaneSelect
		},
		{
			key = 'h',
			mods = 'LEADER',
			action = wezterm.action.AdjustPaneSize { 'Left', 20 }
		},
		{
			key = 'j',
			mods = 'LEADER',
			action = wezterm.action.AdjustPaneSize { 'Down', 20 }
		},
		{ key = 'k', mods = 'LEADER', action = wezterm.action.AdjustPaneSize { 'Up', 20 } },
		{
			key = 'l',
			mods = 'LEADER',
			action = wezterm.action.AdjustPaneSize { 'Right', 20 }
		}
	}
end

return keybinds
