"Kevin Townsend's personal vimrc file. This file is free to use, modify and distribute without charge. No warranty of any kind is provided with this file.
set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-easy-align'
Plug 'google/vim-maktaba'
Plug 'google/vim-glaive'
Plug 'google/vim-codefmt'
Plug 'bazelbuild/vim-bazel'
Plug 'tpope/vim-fugitive'
"Plug 'xaizek/clang_complete'
Plug 'ycm-core/YouCompleteMe'
"Plug 'tibabit/vim-templates'
call plug#end()

filetype plugin indent on    " required

call glaive#Install()

augroup autoformat_settings
  autocmd FileType FileType c,cpp AutoformatBuffer clang-format
augroup END

"set efm=**\ Error:\ %f(%l)%m
"set nosmartindent
"
"syn sync lines=1000

"vim-templates
let g:tmpl_search_paths = []

"ycm
let g:ycm_global_ycm_extra_conf = "~/.ycm_extra_conf.py"

augroup templates
  autocmd BufNewFile *_test.cc 0r ~/.vim/templates/test_cc.template
  autocmd BufNewFile *_comp.cc 0r ~/.vim/templates/comp_cc.template
  autocmd BufNewFile *\(_test\)|\(_comp\)\@<!.cc 0r ~/.vim/templates/cc.template
  autocmd BufNewFile *.h 0r ~/.vim/templates/h.template
augroup END

"vimtex
let g:vimtex_view_method = 'sumatrapdf'

"common commands to set
set sw=2
set et
set ts=2
set autoindent
set smartindent
syntax on
set backspace=2
set ruler
set mouse=a
set ttymouse=xterm2

set nospell

let mapleader=","

"no we don't need more cow bell
set belloff=all

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

silent! source ~/.vimrc-g-shared-post
silent! source ~/.vimrc-g-osx-post
silent! source ~/.vimrc-g-goobuntu-post
