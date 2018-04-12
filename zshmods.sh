#!/bin/bash

git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
sed -i -e 's|ZSH_THEME="robbyrussell"|ZSH_THEME="spaceship"|g' ~/.zshrc
tee -a ~/.zshrc << EOF

#allows wpgtk to apply to new terms
(cat $HOME/.config/wpg/sequences &)

#ncmpcpp loses wpgtk theming on resize (outside of tmux), source fixes
alias ncmpcpp='ncmpcpp ; source ~/.zshrc'

#launch neovim by typing vim
alias vim='nvim'

#wmctrl for alacritty fullscreen in floating WMs
alias wq='wmctrl -r "Alacritty" -b toggle,fullscreen'

#docker aliases
alias weechat='docker start weechat && docker attach weechat'
alias rain='docker run --rm --log-driver none -it beezu/matrix-rain ; source ~/.zshrc' #kills wpgtk theming on exit, source fixes
alias colorpuke='docker run --rm --log-driver none -it beezu/colorpuke ; clear' #clears at end to remove leftover colors

#xrandr rotation aliases
alias sright='xrandr --output eDP-1 --rotation right'
alias sleft='xrandr --output eDP-1 --rotation left'
alias snorm='xrandr --output eDP-1 --rotation normal'
alias sinvert='xrandr --output eDP-1 --rotation inverted'

#prints temp zones out, useful for configuring temp in polybar
alias lstemps='for i in /sys/class/thermal/thermal_zone*; do echo "$i: $(<$i/type)"; done'

#disable caps lock, set it to fucntion as left ctrl
setxkbmap -option ctrl:nocaps
EOF
