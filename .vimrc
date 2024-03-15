set hidden
set nocompatible              
filetype off                  " required

execute pathogen#infect()
call pathogen#helptags()

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'jelera/vim-javascript-syntax'
"Plugin 'ctrlpvim/ctrlp.vim'
"Plugin 'rking/ag.vim'
"Plugin 'scrooloose/nerdtree'
Plugin 'epmatsw/ag.vim'

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

let g:clang_format_path = '/usr/local/opt/llvm/bin/clang-format'
map <C-K> :py3f /Users/danielbevenius/work/vim/vim-settings/clang-format.py<cr>
imap <C-K><c-o>:py3f /Users/danielbevenius/work/vim/vim-settings/clang-format.py<cr>

runtime! ftplugin/man.vim
"
set runtimepath^=~/.vim/bundle/ag

set scrolloff=0

:command -nargs=1 Nmeta :silent :r! git node metadata <args> 2>&1 | sed -n -e '/Generated metadata/,/----/ p'

execute "digraphs ks " . 0x2096
execute "digraphs as " . 0x2090
execute "digraphs es " . 0x2091
execute "digraphs hs " . 0x2095
execute "digraphs is " . 0x1D62
execute "digraphs ks " . 0x2096
execute "digraphs ls " . 0x2097
execute "digraphs ms " . 0x2098
execute "digraphs ns " . 0x2099
execute "digraphs nS " . 0x2099
execute "digraphs os " . 0x2092
execute "digraphs ps " . 0x209A
execute "digraphs rs " . 0x1D63
execute "digraphs ss " . 0x209B
execute "digraphs ts " . 0x209C
execute "digraphs us " . 0x1D64
execute "digraphs vs " . 0x1D65
execute "digraphs xs " . 0x2093
execute "digraphs oo " . 0x2022

execute "digraphs aS " . 0x1d43
execute "digraphs bS " . 0x1d47
execute "digraphs cS " . 0x1d9c
execute "digraphs dS " . 0x1d48
execute "digraphs eS " . 0x1d49
execute "digraphs fS " . 0x1da0
execute "digraphs gS " . 0x1d4d
execute "digraphs hS " . 0x02b0
execute "digraphs iS " . 0x2071
execute "digraphs jS " . 0x02b2
execute "digraphs kS " . 0x1d4f
execute "digraphs lS " . 0x02e1
execute "digraphs mS " . 0x1d50
execute "digraphs nS " . 0x207f
execute "digraphs oS " . 0x1d52
execute "digraphs pS " . 0x1d56
execute "digraphs rS " . 0x02b3
execute "digraphs sS " . 0x02e2
execute "digraphs tS " . 0x1d57
execute "digraphs uS " . 0x1d58
execute "digraphs vS " . 0x1d5b
execute "digraphs wS " . 0x02b7
execute "digraphs xS " . 0x02e3
execute "digraphs yS " . 0x02b8
execute "digraphs zS " . 0x1dbb

let g:syntastic_disabled_filetypes=['mdl']
let g:syntastic_markdown_checkers=['']

let g:syntastic_rust_checkers=['rustc']
let g:syntastic_check_on_open = 0

let g:syntastic_ignore_files = ['.s']

autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/
"autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/,$RUST_SRC_PATH/rusty-tags.vi
"autocmd BufWritePost *.rs :silent! exec "!rusty-tags vi --quiet --start-dir=" . expand('%:p:h') . "&" | redraw!

set wildignore+=*.elf,*.hex,*.map,*.jpg,*.lst,*.o

nmap <F8> :TagbarToggle<CR>

call plug#begin()
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting
"
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0

"inoremap <silent><expr> <TAB>
"      \ pumvisible() ? "\<C-n>" :
"      \ <SID>check_back_space() ? "\<TAB>" :
"      \ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

"inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-y>"
"
"
nnoremap <c-n> :buffers<CR>:buffer<Space>

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

let g:copilot_filetypes = {
    \ 'gitcommit': v:true,
    \ 'markdown': v:true,
    \ 'yaml': v:true
    \ }

imap <C-p> <Plug>(copilot-next)
imap <C-n> <Plug>(copilot-previous)
imap <C-s> <Plug>(copilot-suggest)
"nmap <C-p> :Copilot split<CR>
"imap <silent> <C-o> :Copilot split<CR>
inoremap <C-o> <Esc>:Copilot panel<CR>i

set nopaste

nmap <C-d> :NERDTreeToggle<CR>
autocmd BufEnter *.tpp :setlocal filetype=cpp

"nmap <C-a> :CocAction('codeAction')<CR>
"nmap <C-a>a <Plug>(coc-codeaction)
nmap <C-a> :call CocActionAsync('codeAction', 'cursor')<CR>


