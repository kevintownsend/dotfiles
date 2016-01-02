"Kevin Townsend's personal vimrc file. This file is free to use, modify and distribute without charge. No warranty of any kind is provided with this file.
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'WeiChungWu/vim-SystemVerilog'
"YouCompleteMe takes too long to load
"Plugin 'Valloric/YouCompleteMe'
Plugin 'lervag/vimtex'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"vimtex
let g:vimtex_view_method = 'sumatrapdf'

"common commands to set
set sw=4
set et
set ts=4
set autoindent
set smartindent
syntax on
set backspace=2
set ruler
set mouse=a

"set spell

"keep 5 lines above and below the cursor.
set scrolloff=5
"easy split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"white space highlighting
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" automatically reload vimrc when it's saved
au BufWritePost .vimrc so ~/.vimrc

"numbering
set number

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"allow larger yanks
set viminfo='1000,<1000,s10,h

"auto save/load folds
au BufWinLeave * mkview
au BufWinEnter * silent loadview
set pastetoggle=<F2>
set clipboard=unnamed

vnoremap < <gv
vnoremap > >gv

map Y y$

imap <up> <c-o>gk
imap <down> <c-o>gj

"get block cursor
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

"Clear search highlights
"noremap <silent><Leader>/ :nohls<CR>

"remapping esc
inoremap qq <Esc>

"increase the number of tab pages
set tabpagemax=15

"autosave
au FocusLost * silent! wa
