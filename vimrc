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

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set sw=4
set et
set ts=4
set autoindent
set smartindent
syntax on
set backspace=2
set ruler
set mouse=a
"easy split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

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
