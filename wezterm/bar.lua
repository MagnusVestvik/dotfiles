local tab_bar = {}

function tab_bar.setup_tab_bar(config)
    config.use_fancy_tab_bar = false
    config.tab_bar_at_bottom = false
    config.hide_tab_bar_if_only_one_tab = true
end

return tab_bar
