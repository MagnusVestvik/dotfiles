source ~/.zplug/init.zsh
# Install plugins if there are plugins that have not been installed


# Autocomplete
zplug "zsh-users/zsh-autosuggestions"

# Enhanced ls formatting
zplug "ogham/exa"

# Zsh vim mode but supposedly better
zplug "softmoth/zsh-vim-mode"
zplug "trapd00r/zsh-syntax-highlighting-filetypes"

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
# Needs to be at the end
eval "$(starship init zsh)"

if [[ -n $GHOSTTY_RESOURCES_DIR ]]; then
  source "$GHOSTTY_RESOURCES_DIR"/shell-integration/zsh/ghostty-integration
fi

# Vim mode
bindkey -v enable 

alias ls='eza -lh'
alias docker='sudo docker'

export EZA_CONFIG_DIR=.config/eza

