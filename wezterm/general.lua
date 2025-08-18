local general_settings = {}
local wezterm = require 'wezterm'
function general_settings.setup_general_settings(config)
    config.default_prog = { 'fish' }

    config.font_size = 20
    config.ssh_domains = wezterm.default_ssh_domains()

    -- change from ugly bar

    -- set colorscheme
    config.color_scheme = 'Kanagawa (Gogh)'
    -- enables wayland
    config.enable_wayland = false

    config.window_background_opacity = 0.7
    config.macos_window_background_blur = 50

    config.window_close_confirmation = "NeverPrompt"

    config.term = "xterm-256color"

    config.quit_when_all_windows_are_closed = true
end

return general_settings
