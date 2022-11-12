"Install Vim Plug for Vim
"if empty(glob('~/.vim/autoload/plug.vim'))                                      
"  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs                      
"    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim       
"  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC                       
"endif                                                                           

"Install Vim Plug for Neovim
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"disable mouse
set mouse=

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

set nu "enable line numbers

" Adds support for leaving insert mode with jj
inoremap jj <Esc>

set ts=2 sw=2 et
set autoindent
set smartindent
set smarttab
set softtabstop=4

" Plugins
call plug#begin('~/.vim/plugged')
"Plug 'deviantfero/wpgtk.vim'                           "wpgtk color support
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } "NerdTree folder browser
Plug 'bling/vim-airline'                                "Powerline vim statusbar
Plug 'vim-airline/vim-airline-themes'                   "For themes, see https://github.com/vim-airline/vim-airline/wiki/Screenshots
Plug 'morhetz/gruvbox'                                  "Gruvbox theme
Plug 'rust-lang/rust.vim'                               "Rust integrations
call plug#end()

colorscheme gruvbox
set background=dark
set termguicolors

let g:airline_theme = 'gruvbox'   "sets the Airline theme
let g:airline_powerline_fonts = 1 "enables powerline for Airline

" hotkey bindings
let mapleader = ","
nnoremap <leader>d :NERDTreeToggle<cr>
nnoremap <leader>r :set paste<cr>
nnoremap <leader>e :set nopaste<cr>
nnoremap <leader>v :vnew<cr>
nnoremap <leader>h :new<cr>

" move swapfile to RAM
set directory=/dev/shm
