call plug#begin('~/.local/share/nvim/plugged')

Plug 'jceb/vim-orgmode'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'

Plug 'valloric/MatchTagAlways'
Plug 'neomake/neomake'
Plug 'psf/black', { 'tag': '19.10b0' }

Plug 'jnurmine/Zenburn'
Plug 'morhetz/gruvbox'
Plug 'icymind/NeoSolarized'
Plug 'sjl/badwolf'

Plug 'airblade/vim-gitgutter'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'HerringtonDarkholme/yats.vim'

Plug 'skywind3000/asyncrun.vim'

Plug 'rust-lang/rust.vim'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'liuchengxu/vista.vim'

Plug 'benmills/vimux'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'chrisbra/Colorizer'

Plug 'Vimjas/vim-python-pep8-indent'  "" Fix python indentation


Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-unimpaired'


Plug 'mhinz/vim-startify'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'rhysd/vim-clang-format'

Plug 'justinmk/vim-sneak'
call plug#end()

function! VimuxSlime()
    call VimuxSendText(@v)
    call VimuxSendKeys("Enter")
endfunction

" ----------------------------------------------------------------------------
" DiffRev
" ----------------------------------------------------------------------------
let s:git_status_dictionary = {
            \ "A": "Added",
            \ "B": "Broken",
            \ "C": "Copied",
            \ "D": "Deleted",
            \ "M": "Modified",
            \ "R": "Renamed",
            \ "T": "Changed",
            \ "U": "Unmerged",
            \ "X": "Unknown"
            \ }
function! s:get_diff_files(rev)
  let list = map(split(system(
              \ 'git diff --name-status '.a:rev), '\n'),
              \ '{"filename":matchstr(v:val, "\\S\\+$"),"text":s:git_status_dictionary[matchstr(v:val, "^\\w")]}'
              \ )
  call setqflist(list)
  copen
endfunction

command! -nargs=1 DiffRev call s:get_diff_files(<q-args>)

let b:eslint_exe = substitute(system('npm bin') ,'\n', '', 'g') . '/eslint'
let b:neomake_eslint_exe = b:eslint_exe
let g:neomake_typescript_enabled_makers = ['eslint']

let g:startify_change_to_vcs_root = 1
let g:startify_change_to_dir = 0

autocmd CursorHold * silent call CocActionAsync('highlight')
