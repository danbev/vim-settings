set nocompatible              
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdtree'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set t_Co=256
syntax on
set background=dark
colorscheme distinguished
set nu
set shortmess+=I
set ruler
autocmd BufNewFile,BufRead *.json setf javascript
" allow per project .vimrc settings
set exrc
set secure

set colorcolumn=80
highlight ColorColumn ctermbg=darkgray
