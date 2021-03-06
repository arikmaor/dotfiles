call plug#begin('~/.config/nvim/plugged')

" theme
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'

Plug 'mhinz/vim-startify'

" nerdtree file tree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" editorconfig
Plug 'editorconfig/editorconfig-vim'

" auto complete brackets
Plug 'jiangmiao/auto-pairs'

" fzf
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" comment out code
Plug 'tpope/vim-commentary'

" syntax highlighting
Plug 'HerringtonDarkholme/yats.vim'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

" git integration
Plug 'airblade/vim-gitgutter'

" terraform integration
Plug 'hashivim/vim-terraform'

" auto completion
Plug 'neoclide/coc.nvim', {'branch': 'release' }

" show blame inline
Plug 'APZelos/blamer.nvim'

" indentation markers
" Plug 'Yggdroot/indentLine'

" text objects
Plug 'vim-scripts/argtextobj.vim'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'michaeljsmith/vim-indent-object'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

call plug#end()

colorscheme gruvbox

let mapleader=" "

set wildignore+=*/dist/*,*/node_modules/*
set number
set relativenumber

" enable blamer plugin
let g:blamer_enabled = 1

let g:airline_powerline_fonts = 1

" close nerdtree on file open
let NERDTreeQuitOnOpen = 1

" make nerdtree prettier
let NERDTreeMinimalUI = 1

let NERDTreeIgnore = ['dist', 'node_modules', '.git', '__pycache__']

" Read ~/.NERDTreeBookmarks file and takes its second column
function! s:nerdtreeBookmarks()
    let bookmarks = systemlist("cut -d' ' -f 2 ~/.NERDTreeBookmarks")
    let bookmarks = bookmarks[0:-2] " Slices an empty last line
    return map(bookmarks, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_lists = [
        \ { 'type': function('s:nerdtreeBookmarks'), 'header': ['   NERDTree Bookmarks']}
        \]

" returns all modified files of the current git repo
" `2>/dev/null` makes the command fail quietly, so that when we are not
" in a git repo, the list will be empty
function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_lists = [
        \ { 'type': 'files',     'header': ['   MRU']            },
        \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \ { 'type': function('s:nerdtreeBookmarks'), 'header': ['   NERDTree Bookmarks'] },
        \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
        \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]

let g:startify_change_to_vcs_root = 1

autocmd StdinReadPre * let s:std_in=1

" autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
" autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
runtime coc.vim

" mouse control in normal mode
set mouse=n

" autoload changed files
set autoread
au FocusGained,BufEnter * checktime

" nerdtree hotkey
nmap <Leader>b :NERDTreeFind<CR>
nmap <Leader>v :NERDTreeToggle<CR>

" fzf
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
map <Leader>o :Files<CR>
map <Leader>f :Ag<space>

" Fix insert mode cursor
highlight Cursor guifg=white guibg=black
highlight iCursor guifg=white guibg=steelblue
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10

" easier split nav
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" tab navigation
nnoremap <C-[> :tabp<CR>
nnoremap <C-]> :tabn<CR>

" easier clipboard
noremap <Leader>y "*y
noremap <Leader>p "*p
