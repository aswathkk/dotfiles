call plug#begin('~/.local/share/nvim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'lambdalisue/vim-manpager'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'mhartington/oceanic-next'
Plug 'vim-airline/vim-airline'
Plug 'w0rp/ale'
Plug 'Yggdroot/indentLine'
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
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
colorscheme OceanicNext

" mappings
let mapleader=','

nnoremap <Leader>nn : NERDTreeToggle<cr>
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>
nnoremap <C-D> :bd<CR>
nnoremap <C-S> :w<CR>

" Autocompletion of (, {, [, ' and "
inoremap ( ()<esc>i
inoremap { {}<esc>i
inoremap [ []<esc>i
inoremap ' ''<esc>i
inoremap " ""<esc>i

" indentLine
let g:indentLine_char = '┊'

" vim-airline
let g:airline_theme='oceanicnext'
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

