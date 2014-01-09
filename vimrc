"Kevin Townsend's personal vimrc file. This file is free to use, modify and distribute without charge. No warranty of any kind is provided with this file.
set nocompatible
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
