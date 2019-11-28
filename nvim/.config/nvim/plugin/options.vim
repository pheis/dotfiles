set scrolloff=3
set sidescrolloff=3

set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4

set number relativenumber  " show line numbers
set showcmd  " show command in bottom bar
set wildmenu    " visual autocomplete for command menu
set showmatch
set incsearch
set hlsearch

set termguicolors
set winblend=10
set pumblend=10

let g:gruvbox_contrast_light='hard'
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_italic=1
set background=dark
let g:airline_theme='gruvbox'
let g:zenburn_disable_Label_underline = 1
colo gruvbox

set updatetime=250


let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'
let g:gitgutter_override_sign_column_highlight = 1
highlight SignColumn guibg=bg
highlight SignColumn ctermbg=bg
