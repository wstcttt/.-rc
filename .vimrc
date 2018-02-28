set nu
set ff=unix
set fileformat=unix
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
set showmatch           " highlight matching [{()}]
set hlsearch		" highlight search
set showmode
set tags=./tags,tags,/mts-pek/home/tjun/dev/python/tags

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

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
