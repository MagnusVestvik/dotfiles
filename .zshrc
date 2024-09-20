eval "$(starship init zsh)"
eval "$(zoxide init bash)"
eval "$(fzf --bash)"
alias ls='eza'
alias folder='joshuto'

export LDFLAGS="-L/opt/homebrew/opt/msodbcsql@13.1.9.2/lib"
export CPPFLAGS="-I/opt/homebrew/opt/msodbcsql@13.1.9.2/include"

# bun completions
[ -s "/Users/magnus/.bun/_bun" ] && source "/Users/magnus/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="$PATH:/Users/magnus/.dotnet/tools"
