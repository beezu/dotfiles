" Install Vim Plug for Vim
"if empty(glob('~/.vim/autoload/plug.vim'))                                      
"  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs                      
"    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim       
"  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC                       
"endif                                                                           

" Install Vim Plug for Neovim
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Disable mouse
set mouse=

" Normal Mode - Set arrow keys to home row, swap up and down, unmap h
nmap ; <right>
nmap l <down>
nmap k <up>
nmap j <left>
nmap h <nop>

" Visual Mode - Set arrow keys to home row, swap up and down, unmap h
vmap ; <right>
vmap l <down>
vmap k <up>
vmap j <left>
vmap h <nop>

" Enable line numbers
set nu 

" Adds support for leaving insert/command mode with jj
inoremap jj <Esc>
cnoremap jj <Esc>

" Indent and tab settings
set ts=2 sw=2 et
set autoindent
set smartindent
set smarttab
set softtabstop=4

" Plugins
call plug#begin()
Plug 'junegunn/vim-plug'                                " Adds help info to Vim for Plug
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle' }   " NerdTree folder browser
Plug 'morhetz/gruvbox'                                  " Gruvbox theme
Plug 'bling/vim-airline'                                " Powerline vim statusbar
Plug 'vim-airline/vim-airline-themes'                   " For themes, see https://github.com/vim-airline/vim-airline/wiki/Screenshots
Plug 'mileszs/ack.vim'                                  " Ack search
Plug 'junegunn/fzf', {'do': { -> fzf#install() } }      " Fuzzy finder search
Plug 'vim-syntastic/syntastic', { 'on': [] }            " Syntax error highlighting in code, lazy load
Plug 'rust-lang/rust.vim', { 'on': [] }                 " Rust IDE Integrations, lazy load
call plug#end()

" Load IDE-related plugins lazily
augroup rust
  autocmd!
  autocmd FileType rust call plug#load('syntastic', 'rust.vim')
        \| autocmd! rust
augroup END

" Gruvbox + color settings
colorscheme gruvbox
set background=dark

" Airline theme settings + Powerline font support
let g:airline_theme = 'gruvbox'
let g:airline_powerline_fonts = 1

" Use Ag search with Ack plugin, if available
if executable('ag')
  let g:ackprg = 'ag --vimgrep --hidden'
endif

" Don't jump to first result in Ack
cnoreabbrev Ack Ack!

" Enable full RGB support
set termguicolors

" Hotkey bindings
let mapleader = ","
nnoremap <Leader>a :Ack!<Space>
nnoremap <Leader>f :FZF<cr>
nnoremap <leader>d :NERDTreeToggle<cr>
nnoremap <leader>h :new<cr>
nnoremap <leader>v :vnew<cr>
nnoremap <leader>u :PlugUpdate <Bar> PlugUpgrade<cr>

" Move swapfile to tmp
set directory=/tmp
