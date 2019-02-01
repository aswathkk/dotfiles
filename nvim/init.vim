call plug#begin('~/.local/share/nvim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'lambdalisue/vim-manpager'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'w0rp/ale'
Plug 'Yggdroot/indentLine'
Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'
call plug#end()

" general settings
set nobackup
set nowritebackup
set noswapfile
set number
set mouse=a
set shiftwidth=4
set expandtab
set tabstop=4
set softtabstop=4
set nowrap
set cursorline
set termguicolors
set hidden
syntax enable

" onedark colorscheme
colorscheme onedark
let g:onedark_terminal_italics=1
let g:onedark_termcolors=256
let g:onedark_hide_endofbuffer=0

" mappings
let mapleader=','

nnoremap <Leader>nn : NERDTreeToggle<cr>
nnoremap <C-N> :bnext<CR>
inoremap <C-N> <esc>:bnext<CR>
nnoremap <C-P> :bprev<CR>
inoremap <C-P> <esc>:bprev<CR>
nnoremap <C-D> :bp\|bd #<CR>
inoremap <C-D> <esc>:bp\|bd #<CR>
nnoremap <C-S> :w<CR>
inoremap <C-S> <esc>:w<CR>
nnoremap <C-Q> :q<CR>
inoremap <C-Q> <esc>:q<CR>

" Ctrl + C to xclip
vnoremap <C-c> "+y

" indentLine
let g:indentLine_char = '┊'

" vim-airline
let g:airline_theme='onedark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" nerdcommenter
let g:NERDSpaceDelims = 1

" gitgutter
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_sign_added                     = '+'
let g:gitgutter_sign_modified                  = '±'
let g:gitgutter_sign_removed                   = '-'
let g:gitgutter_sign_removed_first_line        = '×'
let g:gitgutter_sign_modified_removed          = '×'

