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

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" mouse control in normal mode
set mouse=n

" easier split nav
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

let mapleader=","

" nerdtree hotkey
nmap <Leader>b :NERDTreeFind<CR>

