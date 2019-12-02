""""" Start for Vundle plugin manager
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'luochen1990/rainbow'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
""""" End for Vundle

set nu
set fileformat=unix
set showcmd             " show command in bottom bar
set cursorline          " highlight current line: cul
set cuc                 " current column: cuc
set showmatch           " highlight matching [{()}]
set hlsearch		" highlight search
set showmode
set tags=./tags,tags

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" show more info on statusline
set laststatus=2
set statusline=%F       "full path of the file
set statusline+=\ [%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=\ %h      "help file flag
set statusline+=\ %m      "modified flag
set statusline+=\ %r      "read only flag
set statusline+=\ %y      "filetype
set statusline+=%=      "left/right separator
set statusline+=\ col:%c,     "cursor column
set statusline+=\ row:%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file

" for yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

"list file when tab with :e
set wildmode=list,full

" plugin/taglist.vim
let Tlist_Auto_Highlight_Tag        = 1
let Tlist_Auto_Update               = 1
let Tlist_File_Fold_Auto_Close      = 1
let Tlist_Highlight_Tag_On_BufEnter = 1
let Tlist_Show_One_File             = 0
let Tlist_Use_Right_Window          = 0
nnoremap <silent> <F8> :TlistToggle<CR>

" reload file if changed by others
set autoread

" color scheme
set t_Co=256
colorscheme desert
syntax on
let python_highlight_all = 1

" color for cul and cuc
highlight CursorLine   cterm=NONE ctermbg=black ctermfg=blue
" highlight CursorColumn cterm=NONE ctermbg=LightGray ctermfg=green guibg=NONE guifg=NONE
highlight CursorColumn cterm=NONE ctermbg=blue ctermfg=white guibg=blue guifg=white

" highlight trailing spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
" match only work for current window, use autocmd to apply to new open buffers
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" For netrw
let g:netrw_liststyle = 3  " tree view
let g:netrw_altv = 1       " open splits to the right
let g:netrw_list_hide = '.*\.swp$'

"""default open in same window, 1 in new h-split, 2 in v-split, 3 in new tab
"""4 in previous window
let g:netrw_browse_split = 2

let g:netrw_winsize = 20

"""Auto open netrw when open vim
" augroup ProjectDrawer
"   autocmd!
"   autocmd VimEnter * :Vexplore
"   autocmd VimEnter * :wincmd p
" augroup END
nnoremap <silent> <F9> :Vex<CR>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"Copy/paste with system clipboard
noremap <Leader>y "+y
noremap <Leader>x "+x
noremap <Leader>p "+p
noremap <Leader>P "+P
noremap <Leader>yy "+yy
noremap <Leader>dd "+dd
"set clipboard=unnamedplus

" Search down into subfolders
" " Provides tab-completion for all file-related tasks
set path+=**
set wildmenu

" AUTOCOMPLETE:
" The good stuff is documented in |ins-completion|
" HIGHLIGHTS:
" - ^x^n for JUST this file
" - ^x^f for filenames (works with our path trick!)
" - ^x^] for tags only
" - ^n for anything specified by the 'complete' option

" allow backspace to go over indent etc
set backspace=indent,eol,start

" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END


" https://github.com/luochen1990/rainbow/blob/master/README_zh.md
let g:rainbow_conf = {
    \    'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
    \    'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
    \    'operators': '_,_',
    \    'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
    \    'separately': {
    \        '*': {},
    \        'tex': {
    \            'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
    \        },
    \        'lisp': {
    \            'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
    \        },
    \        'vim': {
    \            'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
    \        },
    \        'html': {
    \            'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
    \        },
    \        'css': 0,
    \    }
    \}
let g:rainbow_active = 1
