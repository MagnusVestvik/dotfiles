return function(hyprland)
	local commands_to_execute = { "waybar", "hyprpaper" }
	for _, program in ipairs(commands_to_execute) do
		hyprland.dsp.exec_cmd(program)
	end
end
