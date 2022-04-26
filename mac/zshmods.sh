#!/bin/zsh

# Set zsh theme to Spaceship
sed -i -e 's|ZSH_THEME="robbyrussell"|ZSH_THEME="spaceship"|g' ~/.zshrc

# Add context highlighting plugin
sed -i -e 's|plugins=(git)|plugins=(git zsh-syntax-highlighting)|g' ~/.zshrc

# Append to the bottom of zshrc
tee -a ~/.zshrc << EOF

# Enable alt/option for jumping between words on Mac in Alacritty
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# Set default editor
export EDITOR='nvim'
alias vim='nvim'

# Configure Homebrew variables
export HOMEBREW_PREFIX="/opt/homebrew"
export HOMEBREW_CELLAR="/opt/homebrew/Cellar"
export HOMEBREW_NO_ANALYTICS=1

alias x11='open -a XQuartz && xhost + $IP'
IP=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')

# Docker aliases
alias colorpuke-docker='docker run --rm --log-driver none -it beezu/colorpuke ; clear' #clears at end to remove leftover colors
alias rain='docker run --rm --log-driver none -it beezu/matrix-rain ; source ~/.zshrc' #kills wpgtk theming on exit, source fixes
alias cmatrix='docker run --rm --log-driver none -it beezu/cmatrix'
alias pmatrix='docker run --rm --log-driver none -it beezu/pmatrix'
alias ps='sudo pwsh'
alias powershell='sudo pwsh'
alias docker-platform='docker run --rm mplatform/mquery'
alias nf-test-fonts='docker run --rm -it beezu/nf-test-fonts'
alias exo-powershell='docker run --platform=linux/amd64 --rm -it -e POWERSHELL_TELEMETRY_OPTOUT=1 beezu/exo-powershell:latest'
alias exo-powershell-preview='docker run --platform=linux/amd64 --rm -it -e POWERSHELL_TELEMETRY_OPTOUT=1 beezu/exo-powershell:2.0.6-preview4'
EOF
