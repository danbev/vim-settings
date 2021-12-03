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

let g:clang_format_path = '/usr/local/opt/llvm/bin/clang-format'
map <C-K> :py3f /Users/danielbevenius/work/vim/vim-settings/clang-format.py<cr>
imap <C-K><c-o>:py3f /Users/danielbevenius/work/vim/vim-settings/clang-format.py<cr>

runtime! ftplugin/man.vim
"
" commands to find usages of c++ header includes
:command Hfunctional vimgrep 'std::\(function\|bind|cref\|mem_fn\|plus\|minus\|multiplies\|divides\|modulus\|negate\|equal_to\|not_equal_to\|greater\|less\|greater_equal\|less_equal\|bad_function_call\|is_placeholder\|placeholder\|reference_wrapper\)' %:p
:command Hlimits vimgrep 'std::\(numeric_limits\|float_round_style\|float_denorm_style\)' %:p
:command Hclimits vimgrep '\<CHAR_BIT|MB_LEN_MAX\|CHAR_MIN\|CHAR_MAX\|SCHAR_MIN\|SHRT_MIN\|INT_MIN\|LONG_MIN\|LLONG_MIN\|SCHAR_MAX\|SHRT_MAX\|INT_MAX\|LONG_MAX\|LLONG_MAX\|UCHAR_MAX\|USHRT_MAX\|UINT_MAX\|ULONG_MAX\|ULLONG_MAX\>' %:p
:command Halgorithm vimgrep 'std::\(<all_of\|any_of\|none_of\|for_each\|for_each_n\|count\|count_if\|mismatch\|find\|find_if\|find_if_not\|find_end\|find_first_of\|adjacent_find\|search\|search_n\|copy\|copy_if\|copy_n\|copy_backward\|fill\|fill_n\|transform\|generate\|generate_n\|remove\|remove_if\|remove_copy\|remove_copy_if\|replace\|replace_if\|replace_copy\|replace_copy_if\|swap\|swap_ranges\|iter_swap\|reverse\|reverse_copy\|rotate\|rotate_copy\|shift_left\|shift_right\|random_suffle\|shuffle\|sample\|unique\|unique_copy\|is_partitioned\|partition\|partition_copy\|stable_partition\|partition_point\|is_sorted\|is_sorted_until\|sort\|partial_sort\|partial_sort_copy\|stable_sort\|nth_element\|lower_bound\|upper_bound\|binary_search\|equal_range\|merge\|inplace_merge\|includes\|set_difference\|set_intersection\|set_symmetric_difference\|set_union\|is_heap\|is_heap_until\|make_heap\|push_heap\|pop_heap\|sort_heap\|max\|max_element\|min\|min_element\|minmax\|minmax_element\|clamp\|equal\|lexicographical_compar\|lexicographial_compar_three_way\|is_permutation\|next_permutation\|pre_permutation\)' %:p
:command Hutility vimgrep 'std::\(swap\|exchange\|forward\|move\|move_if_noexcept\|as_const\|declva\lmake_pair\|pair\|integer_sequence\|piecewise_construct_t\|piecewise_construct\|in_place\|in_place_type\|in_place_index\|in_place_t\|in_place_type_t\|in_place_index_t\|tuple\)' %:p
:command Hmemory vimgrep 'std::\(pointer_traits\|pointer_safety\|allocator\|allocator_traits\|allocator_arg_t\|allocator_arg\|uses_allocator\|raw_storage_iterator\|unique_ptr\|shared_ptr\|weak_ptr\|auto_ptr\|atomic\|owner_less\|enable_shared_from_this\|bad_weak_ptr\|default_delete\|hash\|to_address\|addressof\|align\|assume_aligned\|declare_reachable\|undelclare_reachable\|declare_no_pointers\|undeclare_no_pointers\|get_pointer_safety\|uninitialized_copy\|uninitialized_copy_n\|uninitialized_fill\|uninitialized_fill_n\|uninitialized_move\|uninitialized_move_n\|uninitialized_default_construct\|uninitialized_default_construct_n\|uninitialized_value_construct\|uninitialized_value_construct_n\|destroy_at\|destroy\|destroy_n\|get_temporary_buffer\|return_temporary_buffer\|make_unique\|make_unique_default_init\|make_shared\|make_shared_default_init\|allocate_shared\|allocate_shared_default_init\|statid_pointer_cast\|dynamic_pointer_cast\|const_pointer_cast\|reinterpret_pointer_cast\|get_deleter\|swap\|atomic_is_lock_free\|atomic_load\|atomic_load_explicit\|atomic_store\|atomic_store_explicit\|atomic_exchange\|atomic_exchange_explicit\|atomic_compare_exchange_weak\|atomic_exchange_compare_strong\|atomic_exchange_compare_weak_explicit\|atomic_exchange_compare_strong_explicit\)' %:p
:command Hvector vimgrep 'std::\(vector\|begin\|end\|rbegin|rend\|cbegin\|cend\|crbegin\|crend\|size\|max_size\|resize\|capacity\|empty\|reserve\|shrink_to_fit\|at\|front\|back|\data\|push_back\|pop_back\|emplace\|insert\|erase\|swap\|clear\)' %:p

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

let g:syntastic_markdown_checkers=['']

set wildignore+=*.elf,*.hex,*.map,*.jpg
