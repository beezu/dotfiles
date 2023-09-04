# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set Theme (using Starship instead of this, see bottom of config)
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Manually set update period for ZSH
export UPDATE_ZSH_DAYS=7

# Plugins list
plugins=(git zsh-syntax-highlighting docker docker-compose mosh ripgrep \
  rust thefuck)

# Allow stacking completion for docker plugin
# .e. tab completion when using -it instead of requiring -i -t
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes

ZSH_DISABLE_COMPFIX=true

source $ZSH/oh-my-zsh.sh

# Set editor
export EDITOR='nvim'

# Set FZF to use ripgrep
export FZF_DEFAULT_COMMAND='rg --files --hidden'

# Docker-related aliases
alias rain='docker run --rm --log-driver none -it beezu/matrix-rain'
alias cmatrix='docker run --rm --log-driver none -it beezu/cmatrix'
alias pmatrix='docker run --rm --log-driver none -it beezu/pmatrix'
alias rmatrix='docker run --rm --log-driver none -it beezu/rmatrix'
alias docker-platform='docker run --rm mplatform/mquery'
alias nf-test-fonts='docker run --rm -it beezu/nf-test-fonts'
alias exo-powershell='docker run --rm -it -e POWERSHELL_TELEMETRY_OPTOUT=1 \
  beezu/exo-powershell:latest'
alias dockerprune='docker buildx prune -a && docker volume prune -a && \
  docker rm -fv $(docker ps -aq) && docker system prune -a'

alias myip='curl https://ipecho.net/plain'

# FZF aliases
alias kp='ps -ef | fzf'
alias vfzf='vim $(fzf)'
alias efzf='vim $(fzf -e)'
alias afzf='rg . | fzf --print0 -e'

# alias for autoremove-like function for Zypper
alias zyppclean="zypper packages --unneeded \
  | awk -F'|' 'NR==0 || NR==1 || NR==2 || NR==3 || NR==4 {next} {print $3}' \
  | grep -v Name | sudo xargs zypper remove --clean-deps"

# Disable tab completion colors
zstyle ':completion:*' list-colors

# App replacement aliases
alias vim='nvim'
alias l='exa -alT -L 2 --icons'
alias ls='exa -l --icons'
alias lx='exa -alT --icons'
alias grep='rg'
alias top='btm'
alias htop='btm'
alias find='fd'
alias sed='sd'
alias cat='bat'

# Disable tab completion colors
zstyle ':completion:*' list-colors

# Starship prompt
eval "$(starship init zsh)"
