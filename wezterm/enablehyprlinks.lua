local enablehyprlinks = {}
function enablehyprlinks.enable_hyprlinks(config, wezterm)
    config.hyperlink_rules = wezterm.default_hyperlink_rules()

    -- make task numbers clickable
    -- the first matched regex group is captured in $1.
    table.insert(config.hyperlink_rules, {
        regex = [[\b[tt](\d+)\b]],
        format = 'https://example.com/tasks/?t=$1',
    })

    -- make username/project paths clickable. this implies paths like the following are for github.
    -- ( "nvim-treesitter/nvim-treesitter" | wbthomason/packer.nvim | wezterm/wezterm | "wezterm/wezterm.git" )
    -- as long as a full url hyperlink regex exists above this it should not match a full url to
    -- github or gitlab / bitbucket (i.e. https://gitlab.com/user/project.git is still a whole clickable url)
    table.insert(config.hyperlink_rules, {
        regex = [[["]?([\w\d]{1}[-\w\d]+)(/){1}([-\w\d\.]+)["]?]],
        format = 'https://www.github.com/$1/$3',
    })
end

return enablehyprlinks
