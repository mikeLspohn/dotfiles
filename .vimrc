"
" Author: Michael Spohn
" File: .vimrc 
" Github: https://github.com/mikeLspohn/dotfiles/vimrc

" Base Settings
set nocompatible               " be iMproved, required
set incsearch                  " Find as you type search
set hlsearch                   " Highlight search terms
set ignorecase                 " Case insensitive search
set smartcase                  " Case sensitive when upper case characters are present
set backspace=indent,eol,start "allow backspace in insert mode
set number
syntax enable


" Indentations
set tabstop=4
set shiftwidth=2
set expandtab
set softtabstop=2
set autoindent
set smartindent


" Key Mappings
:inoremap jk  <esc> 
" ctrl-c split lines between braces
imap <C-c> <CR><Esc>O               
" remove search hl with backspace
nmap <silent> <BS> :nohlsearch<CR>  


" Plugins (Vim-Plug)
call plug#begin('~/.vim/plugged')
Plug 'lifepillar/vim-solarized8'
Plug 'Raimondi/delimitMate'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'dense-analysis/ale'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'pangloss/vim-javascript'
call plug#end()


" Theme Settings
set termguicolors
set background=dark
let g:solarized_contrast = "high"
let g:solarized_termtrans = 1
colorscheme solarized8


" Plugin Settings

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$'
  \ }
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
"ale
let b:ale_fixers = {'javascript': ['prettier']}
let b:ale_linters = {'javascript': ['eslint']}
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_fix_on_save = 1

