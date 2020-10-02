" __   _(_)_ __ ___  _ __ ___
" \ \ / | | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|



set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required

Plugin 'gmarik/Vundle.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'crusoexia/vim-monokai'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-surround'

call vundle#end()            " required
filetype plugin indent on    " required


" set Ctrl+n to open NERDTree

map <C-n> :NERDTreeToggle<CR>



" airline config

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='deus'
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'



" Type :WipeReg commnd to clear all registers

command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor



" Splittin

set splitbelow
set splitright



"split navigations

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>



" Enable folding

set foldmethod=indent
set foldlevel=99




" Enable folding with the spacebar

nnoremap <space> za
let g:SimpylFold_docstring_preview=1



" cycling through buffers

map <F9> :bprevious<CR>
map <F10> :bnext<CR>



" UTF-8 Support

set encoding=utf-8



" python syntax

let python_highlight_all=1
syntax on



" Theme

syntax on
"colorscheme monokai
set t_Co=256 
let g:monokai_term_italic = 1
let g:monokai_gui_italic = 1

" personal preferences

set nu
set cursorline
set tabstop=4
set ruler
set expandtab
set backspace=indent,eol,start
set hidden
set showmode
set title
set laststatus=2
set directory=$HOME/.vim/swp//
set backupdir=~/.vim/.backup//
set undofile   " Maintain undo history between sessions
set undodir=~/.vim/undodir

" Set the cursor after the last char
set virtualedit=onemore

" alias to run from ESC button
:inoremap jk <Esc>


"Vim transparency
let t:is_transparent = 0
function! Toggle_transparent()
    if t:is_transparent == 0
        hi Normal guibg=NONE ctermbg=NONE
        let t:is_transparent = 1
    else
        set background=dark
        let t:is_tranparent = 0
    endif
endfunction
nnoremap <C-t> : call Toggle_transparent()<CR>


" Run code With <F1> button

autocmd FileType python map <buffer> <F1> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F1> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>
