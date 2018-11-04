call plug#begin('~/.local/share/nvim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'mhartington/oceanic-next'
Plug 'vim-airline/vim-airline'
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
syntax enable
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
colorscheme OceanicNext

" mappings
let mapleader=','

nnoremap <Leader>nn : NERDTreeToggle<cr>

" indentLine
let g:indentLine_char = '┊'

" vim-airline
let g:airline_theme='oceanicnext'
let g:airline_powerline_fonts = 1

