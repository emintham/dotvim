" ==  1. IMPORTANT ==
set nocompatible    " ViM mode
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'

call vundle#end()

" see :option to read more about all options
"     :h <option> to read more about a specific option
syntax enable
filetype plugin indent on
colors herald

let mapleader=","

" == 2. Moving around, Searching, and Patterns ==
set incsearch
set ignorecase
set smartcase

" == 3. Tags ==

" == 4. Displaying Text ==
set scrolloff=2
set nowrap
set number

" == 13. Editing Text ==
set bs=indent,eol,start

" == 14. Tabs and Indenting
set ts=4
set sw=4
set et

" == 15. Folding ==
" ---------------------------------------------------------
"  Helpful commands:  zc    close a fold
"                     zo    open a fold
"                     za    toggle current fold
"                     zR    open all folds
"                     zM    close all folds
" ---------------------------------------------------------
set nofen
set fdm=indent

" ViMtips 108: Space to toggle fold open/close if it exists
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" ViMtips 122/991: Save folds when exiting
au BufWinLeave ?* mkview
au BufWinEnter ?* silent loadview

" -- Misc. --
nnoremap <C-c> <Esc>:close<CR>
inoremap <C-s> <Esc>:w<CR>

" ViMtips 878: map F5 to remove trailing spaces
nnoremap <silent> <F5> :let_s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" Highlist 80th column
if exists('+colorcolumn')
  set colorcolumn=80
else
  :match ErrorMsg '\%>80v.\+'
endif

" -- Options for C-like languages --
au FileType c,cpp,cs,java,objc set cindent
au FileType c,cpp,cs,objc, set cino=>2
au FileType java set cino=>4

" -- Options for Python --
au FileType python set ts=4
au FileType python set sw=4
au FileType python set expandtab

" -- Options for HTML --
au FileType html set ts=4
au FileType html set sw=4
au FileType html set expandtab

nmap <F8> :TagbarToggle<CR>

" -- <Ctrl-l> remove search highlighting --
nnoremap <silent> <C-l> :nohl<CR><C-l>
