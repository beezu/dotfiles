" if empty(glob('~/.vim/autoload/plug.vim'))                                      
"   silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs                      
"     \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim       
"   autocmd VimEnter * PlugInstall --sync | source $MYVIMRC                       
" endif                                                                           

if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
"asdf
"
" Normal Mode - Set arrow keys to homerow, swap up and down
nmap ; <right>
nmap l <down>
nmap k <up>
nmap j <left>
" Visual Mode - Set arrow keys to homerow, swap up and down
vmap ; <right>
vmap l <down>
vmap k <up>
vmap j <left>

set nu                                                                              "enable line numbers

" Adds support for leaving insert mode with jj
inoremap jj <Esc>

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'deviantfero/wpgtk.vim'                                                        "wpgtk color support
Plug 'scrooloose/nerdtree'                                                          "NerdTree folder browser
Plug 'bling/vim-airline'                                                            "Powerline vim statusbar
Plug 'vim-airline/vim-airline-themes'                                               "Theming support for Airline
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }                   "Adds search functionality
Plug 'junegunn/fzf.vim'                                                             "Adds ag search
" Plug 'edkolev/tmuxline.vim'                                                       "themes tmux to the current Airline theme
call plug#end()

colorscheme wpgtk                                                                   "enables wpgtk color support

let g:airline_theme = 'dark'                                                        "sets the Airline theme
let g:airline_powerline_fonts = 1                                                   "enables powerline for Airline

" TESTING FFS LOOK OUT
noremap i <esc>:let x = system('echo 255 > /sys/class/leds/*/brightness')<CR>i
inoremap <esc> <esc>:let x = system('echo 0 > /sys/class/leds/*/brightness')<CR><esc>

" hotkey bindings
let mapleader = ","
nnoremap <leader>d :NERDTreeToggle<cr>
nnoremap <leader>a :Ag<cr>
