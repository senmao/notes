
" ================================================== 
" Vundle initialization
" ==================================================
" install vundle plugin firstly from git
" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" This is the Vundle package, which can be found on GitHub.
" For GitHub repos, you specify plugins using the
" 'user/repository' format
Plugin 'gmarik/vundle'

" We could also add repositories with a ".git" extension
Plugin 'scrooloose/nerdtree.git'
Plugin 'vim-scripts/taglist.vim.git'
"Plugin 'kien/ctrlp.vim.git'
" Plugin 'Valloric/YouCompleteMe.git' "remove because it requires 7.4 or later
Plugin 'ervandew/supertab.git'

" To get plugins from Vim Scripts, you can reference the plugin
" by name as it appears on the site
" Plugin 'taglist'

" Now we can turn our filetype functionality back on
filetype plugin indent on

" ================================================== 
" SETTINGS
" ==================================================

syntax on
filetype on " try to detect filetypes

set foldmethod=indent " fold the code block
set foldlevel=99
set autoindent

set number " show line number
set mouse=a " enable mouse
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

" set the path auto-complete
set wildmenu
set wildmode=list:longest
" set the time out for accelerate the esc key
set timeoutlen=1000 ttimeoutlen=10

" add the project path to python path
"let $PYTHONPATH.="/meida/UbuntuUsed/Python/LinuxWorkspace/SGRT:/meida/UbuntuUsed/Python/LinuxWorkspace/SMAO"


" ================================================== 
" MAPS
" ==================================================

" set lead key
let mapleader = ","

" map jk to ESC for fast exit insert mode
inoremap jj <ESC>

" map shortcut for save
nnoremap <leader>s :w<CR>

" window splits
" map Ctrl+<movement> to Ctrl+w,<movement>
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" load module header
nnoremap <leader>h :read /media/UbuntuUsed/Python/LinuxWorkspace/SMAO/general/tuwien_hdr.txt<CR>1Gdd31GccCreated On <C-R>=strftime("%Y-%m-%d %a %H:%M %p")<CR><Esc>G

" move cursor in insert mode
"inoremap <S-h> <C-o>h
"inoremap <S-j> <C-o>j
"inoremap <S-k> <C-o>k
"inoremap <S-l> <C-o>l
"inoremap <S-w> <C-o>w
"inoremap <S-b> <C-o>b
"inoremap <S-e> <C-o>e

" python main part
:autocmd FileType python nnoremap <leader>m oif __name__ == "__main__":<CR>

" python comment and uncomment shortcut
:autocmd FileType python vnoremap <leader>c :s/^/#/g<CR>
:autocmd FileType python nnoremap <leader>c :s/^/#/g<CR>
:autocmd FileType python vnoremap <leader>cc :s/^#//g<CR>
:autocmd FileType python nnoremap <leader>cc :s/^#//g<CR>

" add new line and return normal mode
nnoremap <leader>o o<ESC>
nnoremap <leader>O O<ESC>


" ================================================== 
" EXTENSION 
" ==================================================

" --gvim colorscheme--
if has('gui_running')
    colorscheme harlequin
    set lines=50 columns=120
    let $PYTHONPATH.="/meida/UbuntuUsed/Python/LinuxWorkspace/SGRT:/meida/UbuntuUsed/Python/LinuxWorkspace/SMAO"
endif

" --python virutalenv--
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

"  --omni complete--
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

" --pep8--
" enbale pep8 and map default F5 -> \8
let g:pep8_map='<F8>'


" ================================================== 
" PLUGINS
" ==================================================

" --NERDTree--
" let NERDTreeWinPos="right"
"let NERDTreeHijackNetrw=1
" map shortcut for NERDTree
map <F5> :NERDTree<CR>
let NERDTreeIgnore = ['\.pyc$']
" automatically open NERDTree
"au VimEnter * NERDTree
" move the cursor back
"au VimEnter * wincmd p

" --Taglist--
" map shutcut for TlistOpen
map <F6> :exe "let Tlist_Use_Horiz_Window=0"<CR>:TlistOpen<CR>
" show the tag list window on the right side
let Tlist_Use_Right_Window = 1
let Tlist_Use_Horiz_Window = 1
let Tlist_Sort_Type = "name"
"command Tlist1 TlistOpen | exe "resize".(&lines/2) | wincmd k | wincmd H | exe "vertical resize".(&columns-30)
nnoremap <C-F6> :exe "let Tlist_Use_Horiz_Window=1"<CR>:TlistOpen<CR>:exe "resize".(&lines/2)<CR>:wincmd k<CR>:wincmd H<CR>:exe "vertical resize".(&columns-30)<CR>


" ================================================== 
" FUNCTIONS
" ==================================================

