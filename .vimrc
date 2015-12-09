
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
Plugin 'Valloric/YouCompleteMe.git' " requires 7.4 or later
"Plugin 'kevinw/pyflakes-vim.git'
Plugin 'scrooloose/syntastic.git'
"Plugin 'ervandew/supertab.git'
"Plugin 'davidhalter/jedi-vim.git'
Plugin 'kien/ctrlp.vim'

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

"au FileType python set textwidth=80 formatoptions+=t

" set the path auto-complete
set wildmenu
set wildmode=list:longest
" set the time out for accelerate the esc key
set timeoutlen=1000 ttimeoutlen=10

" set colorcolumn for controlling the line length
set cc=81
hi ColorColumn ctermbg=darkgrey

" add the project path to python path
"let $PYTHONPATH.="/meida/UbuntuUsed/Python/LinuxWorkspace/SGRT:/meida/UbuntuUsed/Python/LinuxWorkspace/SMAO"


" ================================================== 
" MAPS
" ==================================================

" set lead key
let mapleader = ","

" map jk to ESC for fast exit insert mode
inoremap jk <ESC>
vnoremap jk <ESC> 

" map shortcut for save
nnoremap <leader>s :w<CR>
" windows path to linux path
nnoremap <leader>/ :s/\\/\//g<CR>

" window splits
" map Ctrl+<movement> to Ctrl+w,<movement>
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" resize window
nnoremap + <C-W>+
nnoremap - <C-W>-
nnoremap ( <C-W><
nnoremap ) <C-W>>

" move cursor in insert mode
"inoremap <S-h> <C-o>h
"inoremap <S-j> <C-o>j
"inoremap <S-k> <C-o>k
"inoremap <S-l> <C-o>l
"inoremap <S-w> <C-o>w
"inoremap <S-b> <C-o>b
"inoremap <S-e> <C-o>e

" copy, cut and past with system clipboard
vnoremap <c-y> "+y
vnoremap <c-d> "+d
vnoremap <c-p> "+p


" --- leader key maps ---
" load module header
nnoremap <leader>h :read /media/UbuntuUsed/Python/LinuxWorkspace/SMAO/general/tuwien_hdr.txt<CR>1Gdd32GccCreated On <C-R>=strftime("%Y-%m-%d %a %H:%M:%S")<CR><Esc>G
" add break point
nnoremap ,b oimport pdb; pdb.set_trace()<ESC>

" delete and paste, without putting deleted text in default register
vnoremap <leader>p "_dP

" python main part
:autocmd FileType python nnoremap <leader>m oif __name__ == "__main__":<CR>

" python comment and uncomment shortcut
:autocmd FileType python vnoremap <leader>c :s/^/#/g<CR>
:autocmd FileType python nnoremap <leader>c :s/^/#/g<CR>
":autocmd FileType python nnoremap <leader># o# <ESC>60a=<ESC>o# <ESC>o# <ESC>60a=<ESC>ka
:autocmd FileType python nnoremap <leader># o# <ESC>60a=<ESC>
:autocmd FileType python vnoremap <leader>cc :s/^#//g<CR>
:autocmd FileType python nnoremap <leader>cc :s/^#//g<CR>

" remove tailing space in current line
nnoremap <leader><space> :s/\s\+$//g<CR><ESC>


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
"au FileType python set omnifunc=pythoncomplete#Complete
"let g:SuperTabDefaultCompletionType = "context"
"set completeopt=menuone,longest

" --pep8--
" enbale pep8 and map default F5 -> \8
"let g:pep8_map='<F8>'


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
let NERDTreeIgnore = ['\.pyc$', '\.lo$', '\.o$']

" --Taglist--
" map shutcut for TlistOpen
map <F6> :exe "let Tlist_Use_Horiz_Window=0"<CR>:TlistOpen<CR>
" show the tag list window on the right side
let Tlist_Use_Right_Window = 1
let Tlist_Use_Horiz_Window = 1
let Tlist_Sort_Type = "name"
"command Tlist1 TlistOpen | exe "resize".(&lines/2) | wincmd k | wincmd H | exe "vertical resize".(&columns-30)
nnoremap <C-F6> :exe "let Tlist_Use_Horiz_Window=1"<CR>:TlistOpen<CR>:exe "resize".(&lines/2)<CR>:wincmd k<CR>:wincmd H<CR>:exe "vertical resize".(&columns-30)<CR>

"--pyflake--or--syntastic--
highlight SpellBad term=reverse ctermbg=DarkGray ctermfg=White cterm=undercurl


"--Syntastic--
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 5
"let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
nnoremap <leader>q :SyntasticCheck<CR>
" ignore some pep8 errors or warnings
" E501: the line exceed 80 characters
" W391: warning of blank line in end of file
" E303: too many blank line before
let g:syntastic_python_flake8_args='--ignore=E501,W391,E303'

" --jedi--


" --ctrlp--
let g:ctrlp_working_path_mode = 0


" ================================================== 
" FUNCTIONS
" ==================================================

