local general_settings = {}

function general_settings.setup_general_settings(config)
    config.default_prog = { 'fish' }

    config.font_size = 20

    -- change from ugly bar

    -- set colorscheme
    config.color_scheme = 'Kanagawa (Gogh)'
    -- enables wayland
    config.enable_wayland = false

    config.window_background_opacity = 0.7
    config.macos_window_background_blur = 50

    config.window_close_confirmation = "NeverPrompt"

    config.hide_tab_bar_if_only_one_tab = true
end

return general_settings
