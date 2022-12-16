# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set Theme (using Starship instead of this, see bottom of config)
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Manually set update period for ZSH
export UPDATE_ZSH_DAYS=7

# Plugins list
plugins=(git zsh-syntax-highlighting docker docker-compose mosh ripgrep \
  rust thefuck vi-mode)

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
alias colorpuke-docker='docker run --rm --log-driver none -it beezu/colorpuke'
alias colorpuke='~/gits/dockerfiles/colorpuke/colorpuke.sh'
alias rain='docker run --rm --log-driver none -it beezu/matrix-rain'
alias cmatrix='docker run --rm --log-driver none -it beezu/cmatrix'
alias pmatrix='docker run --rm --log-driver none -it beezu/pmatrix'
alias docker-platform='docker run --rm mplatform/mquery'
alias nf-test-fonts='docker run --rm -it beezu/nf-test-fonts'
alias exo-powershell='docker run --platform=linux/amd64 --rm -it \
  -e POWERSHELL_TELEMETRY_OPTOUT=1 beezu/exo-powershell:latest'
alias exo-powershell-preview='docker run --platform=linux/amd64 --rm -it \
  -e POWERSHELL_TELEMETRY_OPTOUT=1 beezu/exo-powershell:2.0.6-preview6'

alias vim='nvim'

# FZF aliases
alias kp='ps -ef | fzf'
alias vfzf='vim $(fzf)'
alias efzf='vim $(rg --files --hidden | fzf -e)'
alias afzf='rg . | fzf --print0 -e'

# Disable tab completion colors
zstyle ':completion:*' list-colors

# Starship prompt
eval "$(starship init zsh)"
