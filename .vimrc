filetype off
"call pathogen#runtime_append_all_bundles()
"call pathogen#helptags()

"set foldmethod=indent
"set foldlevel=99

" show line number
set number

" window splits
" map Ctrl+<movement> to Ctrl+w+<movement>
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-h>h

syntax on
filetype on                     " try to detect filetypes
"filetype plugin indent on       " enable loading indent file for filetype

set tabstop=4
set shiftwidth=4
set softtabstop=4



"map <leader>td <Plug>TaskList
"map <leader>g :GundoToggle<CR>
"let g:pep8_map='<leader>8'

"au FileType python set omnifunc=pythoncomplete#Complete
"let g:SuperTabDefaultCompletionType = "context"
