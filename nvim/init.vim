" Install vim-plug
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync
endif

call plug#begin('~/.local/share/nvim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'lambdalisue/vim-manpager'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'w0rp/ale'
Plug 'Yggdroot/indentLine'
Plug 'joshdick/onedark.vim'
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-jedi'
Plug 'roxma/nvim-yarp'
Plug 'sheerun/vim-polyglot'
Plug 'szw/vim-tags'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
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
nnoremap <C-L> :bnext<CR>
inoremap <C-L> <esc>:bnext<CR>
nnoremap <C-H> :bprev<CR>
inoremap <C-H> <esc>:bprev<CR>
nnoremap <C-D> :bp\|bd #<CR>
inoremap <C-D> <esc>:bp\|bd #<CR>
nnoremap <C-S> :w<CR>
inoremap <C-S> <esc>:w<CR>
nnoremap <C-Q> :q<CR>
inoremap <C-Q> <esc>:q<CR>
vnoremap < <gv
vnoremap > >gv
nnoremap <C-A> ggVGG
vnoremap <C-A> ggVGG

" Ctrl + C to xclip
vnoremap <C-c> "+y

" indentLine
let g:indentLine_char = '┊'

" vim-airline
let g:airline_theme='onedark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" nerdtree
let NERDTreeMinimalUI = 1
let NERDTreeIgnore = ['\.pyc$', '__pycache__']

" nerdcommenter
let g:NERDSpaceDelims = 1
nnoremap <C-_> :call NERDComment('Toggle', 'Toggle')<CR>
vnoremap <C-_> :call NERDComment('Toggle', 'Toggle')<CR>gv

" gitgutter
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_sign_added                     = '+'
let g:gitgutter_sign_modified                  = '±'
let g:gitgutter_sign_removed                   = '-'
let g:gitgutter_sign_removed_first_line        = '×'
let g:gitgutter_sign_modified_removed          = '×'

" vim-tags
let g:vim_tags_auto_generate = 1

" ncm2
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
