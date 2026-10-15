return function(hyprland, utilities)
	local mainMod = "SUPER"
	local terminal = utilities.terminal
	local fileManager = utilities.file_manager
	local launcher_menu = utilities.launcher_menu

	hyprland.bind(mainMod .. " + Return", hyprland.dsp.exec_cmd(terminal))
	hyprland.bind(mainMod .. " + Space", hyprland.dsp.exec_cmd(launcher_menu))
	hyprland.bind(mainMod .. " + E", hyprland.dsp.exec_cmd(fileManager))
	hyprland.bind(mainMod .. " + V", hyprland.dsp.window.float({ action = "toggle" }))
	hyprland.bind(mainMod .. " + R", hyprland.dsp.exec_cmd(launcher_menu))
	hyprland.bind(mainMod .. " + P", hyprland.dsp.window.pseudo())
	hyprland.bind(mainMod .. " + J", hyprland.dsp.layout("togglesplit")) -- dwindle only

	hyprland.bind(mainMod .. " + h", hyprland.dsp.focus({ direction = "left" }))
	hyprland.bind(mainMod .. " + l", hyprland.dsp.focus({ direction = "right" }))
	hyprland.bind(mainMod .. " + k", hyprland.dsp.focus({ direction = "up" }))
	hyprland.bind(mainMod .. " + j", hyprland.dsp.focus({ direction = "down" }))

	for i = 1, 10 do
		local key = i % 10 -- 10 maps to key 0
		hyprland.bind(mainMod .. " + " .. key, hyprland.dsp.focus({ workspace = i }))
		hyprland.bind(mainMod .. " + SHIFT + " .. key, hyprland.dsp.window.move({ workspace = i }))
	end

	-- Move/resize windows with mainMod + LMB/RMB and dragging
	hyprland.bind(mainMod .. " + mouse:272", hyprland.dsp.window.drag(), { mouse = true })
	hyprland.bind(mainMod .. " + mouse:273", hyprland.dsp.window.resize(), { mouse = true })

	hyprland.bind(
		mainMod .. " + u",
		"XF86AudioRaiseVolume",
		hyprland.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ +5%"),
		{ locked = true, repeating = true }
	)
	hyprland.bind(
		mainMod .. " + d",
		"XF86AudioLowerVolume",
		hyprland.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ -5%"),
		{ locked = true, repeating = true }
	)
end
