call plug#begin('~/.config/nvim/plugged')

" theme
Plug 'morhetz/gruvbox'

" nerdtree file tree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

call plug#end()

colorscheme gruvbox

set number
set relativenumber

" nerdtree hotkey
nmap <C-b> :NERDTreeToggle %<CR>
" close nerdtree on file open
let NERDTreeQuitOnOpen = 1

