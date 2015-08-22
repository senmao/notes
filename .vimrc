filetype off
call pathogen#infect()
call pathogen#helptags()

" fold the code block
set foldmethod=indenta
set foldlevel=99

" show line number
set number

" enable mouse
set mouse=a

" window splits
" map Ctrl+<movement> to Ctrl+w,<movement>
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

syntax on
filetype on                     " try to detect filetypes
filetype plugin indent on       " enable loading indent file for filetype

set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

set autoindent

" colorscheme
if has('gui_running')
    colorscheme harlequin
    set lines=50 columns=120
    let $PYTHONPATH.="/meida/UbuntuUsed/Python/LinuxWorkspace/SGRT:/meida/UbuntuUsed/Python/LinuxWorkspace/SMAO"
endif

" enbale pep8 and map default F5 -> \8
let g:pep8_map='<F8>'

" enable auto completion plugin
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest

" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
"set completeopt=menuone,longest,preview
"autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" set the path auto-complete
set wildmenu
set wildmode=list:longest
" set the time out for accelerate the esc key
set timeoutlen=1000 ttimeoutlen=10

" pyflake-vim plugin for syntax validation
" disable the quickfix support for pyflake plugin
"let g:pyflakes_use_quickfix = 0

" add the project path to python path
"let $PYTHONPATH.="/meida/UbuntuUsed/Python/LinuxWorkspace/SGRT:/meida/UbuntuUsed/Python/LinuxWorkspace/SMAO"
" support virutalenv
" Add the virtualenv's site-packages to vim path
py << EOF
import os.path
import sys
import vim

if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

" map shutcut for TlistOpen
map <F6> :exe "let Tlist_Use_Horiz_Window=0"<CR>:TlistOpen<CR>
" show the tag list window on the right side
let Tlist_Use_Right_Window = 1
let Tlist_Use_Horiz_Window = 1
let Tlist_Sort_Type = "name"
"command Tlist1 TlistOpen | exe "resize".(&lines/2) | wincmd k | wincmd H | exe "vertical resize".(&columns-30)
nnoremap <C-F6> :exe "let Tlist_Use_Horiz_Window=1"<CR>:TlistOpen<CR>:exe "resize".(&lines/2)<CR>:wincmd k<CR>:wincmd H<CR>:exe "vertical resize".(&columns-30)<CR>

" NERDTree settings
" let NERDTreeWinPos="right"
"let NERDTreeHijackNetrw=1
" map shortcut for NERDTree
map <F5> :NERDTree<CR>
let NERDTreeIgnore = ['\.pyc$']
" automatically open NERDTree
"au VimEnter * NERDTree
" move the cursor back
"au VimEnter * wincmd p


