PATH=$HOME/.cargo/bin:/opt/homebrew/sbin:/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.fzf/bin:$HOME/Library/Python/3.9/lib/python/site-packages:/opt/X11/bin

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set Theme (using Starship instead of this, see bottom of config)
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Manually set update period for ZSH
export UPDATE_ZSH_DAYS=7

# Plugins list
plugins=(git zsh-syntax-highlighting docker docker-compose macos mosh ripgrep \
  rust thefuck vi-mode)

# Allow stacking completion for docker plugin
# .e. tab completion when using -it instead of requiring -i -t
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes

ZSH_DISABLE_COMPFIX=true

source $ZSH/oh-my-zsh.sh

# Mac OS binding for alt/option key to jump words
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# Set editor
export EDITOR='nvim'

# Homebrew variables and alias
export HOMEBREW_PREFIX="/opt/homebrew"
export HOMEBREW_CELLAR="/opt/homebrew/Cellar"
export HOMEBREW_NO_ANALYTICS=1
alias brewup='brew update && brew services stop spacebar && \
  brew services stop yabai && brew services stop skhd && brew upgrade \
  && brew upgrade --cask && brew services \
  start yabai && brew services start skhd && brew services start spacebar'

# Set FZF to use the silver searcher
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
alias efzf='vim $(fzf -e)'
alias afzf='rg . | fzf --print0 -e'

# Xquartz alias and variable
alias x11='open -a XQuartz && xhost + $IP'
IP=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')

# VI Mode Settings
VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
VI_MODE_SET_CURSOR=true

# Disable tab completion colors
zstyle ':completion:*' list-colors

# Starship prompt
eval "$(starship init zsh)"
