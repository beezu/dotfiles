##########
## PATH ##
##########

PATH=$HOME/.cache/lm-studio/bin:$HOME/.cargo/bin:/opt/homebrew/sbin:/opt/homebrew/bin:$PATH

#############
## GENERAL ##
#############

# zsh var
export ZSH=$HOME/.config/zsh_plugins

# set emacs mode
set -o emacs

# load module that allows shift-tab
zmodload zsh/complist

# TODO: what the fuck is this
ZSH_DISABLE_COMPFIX=true

# set editor for things like sudoedit
export EDITOR='nvim'

# FZF default command
export FZF_DEFAULT_COMMAND='rg --files --hidden'

# Set multi core XZ
export XZ_DEFAULTS='-T 0 -9e'

# Set Swift toolchain path for sourcekit-lsp
export TOOLCHAIN_PATH='~/gits/sourcekit-lsp/.build/debug'

# history shit
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=10000
export SAVEHIST=1000000
setopt HIST_IGNORE_ALL_DUPS
setopt INC_APPEND_HISTORY

# case insensitive completion
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select

#############
## PLUGINS ##
#############

# faster syntax highlighting
source $ZSH/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# zsh substring history
source $ZSH/zsh-history-substring-search/zsh-history-substring-search.plugin.zsh

##############
## KEYBINDS ##
##############

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey "^[[3~" delete-char
bindkey -M menuselect '^[[Z' reverse-menu-complete

# Mac OS binding for alt/option key to jump words
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word


#############
## ALIASES ##
#############

# misc
alias myip='curl https://ipecho.net/plain'
alias weather='curl wttr.in'

# fzf
alias kp='sudo kill $(ps aux | fzf)'
alias kp9='sudo kill -9 $(ps aux | fzf)'
alias vfzf='vim $(fzf)'
alias efzf='vim $(fzf -e)'
alias afzf='rg . | fzf --print0 -e'

# app replacement
alias vim='nvim'
alias l='eza -al --icons=auto'
alias ls='eza -l --icons=auto'
alias lsa='eza -alT -L 2 --icons=auto'

alias brewup='brew update \
  && brew upgrade \
  && brew upgrade --cask \
  && brew cleanup'

# Docker-related aliases
alias m4b-tool='docker run -it --rm -u $(id -u):$(id -g) -v "$(pwd)":/mnt sandreas/m4b-tool:latest'
alias dockerprune='docker buildx prune -a ; \
  docker volume prune -a ; \
  docker rm -v $(docker ps -aq) ; \
  docker system prune -a'


# fzf + aerospace shit
alias ff='aerospace list-windows --all | fzf --bind $'\''enter:execute(bash -c "aerospace focus --window-id {1}")+abort'\'

############
## ZOXIDE ##
############

eval "$(zoxide init zsh)"
alias cd='z'

###########
## THEME ##
###########

eval "$(starship init zsh)"
