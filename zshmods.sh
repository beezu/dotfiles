#!/bin/zsh
sed -i -e 's|ZSH_THEME="robbyrussell"|ZSH_THEME="spaceship"|g' ~/.zshrc
tee -a ~/.zshrc << EOF

export EDITOR='nvim'

export HOMEBREW_PREFIX="/opt/homebrew"
export HOMEBREW_CELLAR="/opt/homebrew/Cellar"
export HOMEBREW_NO_ANALYTICS=1

alias vim='nvim'

#docker aliases
alias colorpuke-docker='docker run --rm --log-driver none -it beezu/colorpuke ; clear' #clears at end to remove leftover colors
alias rain='docker run --rm --log-driver none -it beezu/matrix-rain ; source ~/.zshrc' #kills wpgtk theming on exit, source fixes
alias cmatrix='docker run --rm --log-driver none -it beezu/cmatrix'
alias pmatrix='docker run --rm --log-driver none -it beezu/pmatrix'
alias ps='sudo pwsh'
alias powershell='sudo pwsh'
alias docker-platform='docker run --rm mplatform/mquery'
alias nf-test-fonts='docker run --rm -it beezu/nf-test-fonts'
EOF
