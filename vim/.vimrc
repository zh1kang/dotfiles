set nocompatible

" Turn on syntax highlighting.
syntax on

" Set tab spacing
set tabstop=8
set softtabstop=0
set shiftwidth=4 smarttab
set expandtab

" Disable the default Vim startup message.
set shortmess+=I

" Show line numbers.
set number

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2

set encoding=UTF-8

" The backspace key has slightly unintuitive behavior by default. For example,
" by default, you can't backspace before the insertion point set with 'i'.
" This configuration makes backspace behave more reasonably, in that you can
" backspace over anything.
set backspace=indent,eol,start
set ignorecase
set smartcase
set incsearch

" Remap for my liking
nnoremap J 3j
nnoremap K 3k
vnoremap J 3j
vnoremap K 3k

