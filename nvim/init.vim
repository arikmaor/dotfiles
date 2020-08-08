call plug#begin('~/.config/nvim/plugged')

" theme
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'

" nerdtree file tree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" fzf
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" comment out code
Plug 'tpope/vim-commentary'

" syntax highlighting
Plug 'HerringtonDarkholme/yats.vim'

" git integration
Plug 'airblade/vim-gitgutter'

" terraform integration
Plug 'hashivim/vim-terraform'

" auto completion
Plug 'neoclide/coc.nvim', {'branch': 'release', 'for': 'typescript'}

call plug#end()

colorscheme gruvbox

set wildignore+=*/dist/*,*/node_modules/*
set number
set relativenumber

let g:airline_powerline_fonts = 1

" close nerdtree on file open
let NERDTreeQuitOnOpen = 1

" make nerdtree prettier
let NERDTreeMinimalUI = 1

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
" autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
autocmd Filetype typescript runtime coc.vim

" mouse control in normal mode
set mouse=n

let mapleader=","

" nerdtree hotkey
nmap <Leader>b :NERDTreeFind<CR>
nmap <Leader>v :NERDTreeToggle<CR>

" fzf
map <Leader>w :Files<CR>

" easier split nav
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" tab navigation
nnoremap <C-[> :tabp<CR>
nnoremap <C-]> :tabn<CR>

