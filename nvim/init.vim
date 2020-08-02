call plug#begin('~/.config/nvim/plugged')

" theme
Plug 'morhetz/gruvbox'

" nerdtree file tree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" fzf
Plug 'ctrlpvim/ctrlp.vim'

" comment out code
Plug 'tpope/vim-commentary'

call plug#end()

colorscheme gruvbox

set wildignore+=*/dist/*,*/node_modules/*
set number
set relativenumber

" close nerdtree on file open
let NERDTreeQuitOnOpen = 1

" make nerdtree prettier
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

let mapleader=","

" nerdtree hotkey
nmap <Leader>b :NERDTreeFind<CR>

