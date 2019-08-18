call plug#begin('~/.local/share/nvim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'valloric/MatchTagAlways'
Plug 'neomake/neomake'

Plug 'jnurmine/Zenburn'
Plug 'morhetz/gruvbox'

Plug 'airblade/vim-gitgutter'

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

Plug 'HerringtonDarkholme/yats.vim'

"" Check this at some point:
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}


"" fugitive, airline?
Plug 'skywind3000/asyncrun.vim'

Plug 'rust-lang/rust.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

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

Plug 'junegunn/goyo.vim'

Plug 'mhinz/vim-startify'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'rhysd/vim-clang-format'

Plug 'justinmk/vim-sneak'

"" Plug 'wellle/targets.vim'
"" Plug 'michaeljsmith/vim-indent-object'

Plug 'w0rp/ale'
call plug#end()

let g:sneak#label = 1

"" FZF
let g:fzf_files_options =
  \ '--preview "bat {}"'
let g:fzf_layout = { 'up': '~40%' }

"" nnoremap s <nop>
"" let g:splitjoin_split_mapping = 'sj'
"" let g:splitjoin_join_mapping = 'sk'
"" let g:splitjoin_trailing_comma = 1
"" let g:splitjoin_python_brackets_on_separate_lines = 1
""
"" let g:splitjoin_curly_brace_padding = 1

"" set foldmethod=indent

"" RUST
let g:rustfmt_autosave = 1


"" VIMUX
let g:VimuxOrientation = "h"
let g:VimuxHeight = "40"

 " Run the current file with rspec
nnoremap <Leader>t :call VimuxRunCommand("clear; npx jest --coverage=false" . bufname("%"))<CR>

" Prompt for a command to run
nnoremap <Leader>vp :VimuxPromptCommand<CR>

" Run last command executed by VimuxRunCommand
nnoremap <Leader>vl :VimuxRunLastCommand<CR>

" Inspect runner pane
nnoremap <Leader>vi :VimuxInspectRunner<CR>

" Close vim tmux runner opened by VimuxRunCommand
nnoremap <Leader>vq :VimuxCloseRunner<CR>

nnoremap <Leader>vx :VimuxInterruptRunner<CR>

  " Zoom the runner pane (use <bind-key> z to restore runner pane)
nnoremap <Leader>vz :call VimuxZoomRunner()<CR>

function! VimuxSlime()
    call VimuxSendText(@v)
    call VimuxSendKeys("Enter")
endfunction

  " If text is selected, save it in the v buffer and send that buffer it to tmux
"" vnoremap o "vy :call VimuxSlime()<CR>


"" set autochdir

"" Plugin Options
"" let g:rainbow_active = 0


"" ALE

let g:airline#extensions#ale#enabled = 1


let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
"" let g:ale_linters = { 'cpp': ['clang', 'gcc', 'cppcheck'] }
let g:ale_enabled = 1
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 1

let g:nvim_typescript#diagnostics_enable = 0

" Ale linter / fixers
let g:ale_linters = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'typescript': ['eslint', 'tsserver'],
\   'javascript': ['eslint'],
\   'cpp': ['gcc'],
\}
let g:ale_fixers = {
  \   'typescript': [
  \       'prettier',
  \   ],
  \}

let g:ale_fix_on_save = 1
" Set this. Airline will handle the rest.
"" let g:airline#extensions#ale#enabled = 1
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_echo_msg_format = '%linter%: %s'
" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1

"" AIRLINE

let g:airline_detect_modified=1


"" DEOPLETE

let g:deoplete#enable_at_startup = 1

"" GOYO
let g:goyo_linenr = 1
let g:goyo_height = 100

"" set textwidth=80



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

"" npx eslint --quiet --format unix 'src/**/*.{ts,tsx}'
autocmd Filetype typescript let &makeprg = "(npx tsc && npx eslint --quiet --format unix 'src/**/*.{ts,tsx}')"
autocmd Filetype typescript.tsx let &makeprg = "(npx tsc && npx eslint --quiet --format unix 'src/**/*.{ts,tsx}')"
"" autocmd Filetype typescript let &makeprg = "npx tsc"
"" autocmd Filetype typescript.tsx let &makeprg = "npx tsc"
"" autocmd Filetype typescript set makeprg=npx\ tsc
"" autocmd Filetype typescript.tsx set makeprg=npx\ tsc

autocmd Filetype typescript let &errorformat =
            \ &errorformat . ',' .
            \ '%A%f:%l:%c:%m,%-G%.%#'
autocmd Filetype typescript.tsx let &errorformat =
            \ &errorformat . ',' .
            \ '%A%f:%l:%c:%m,%-G%.%#'

"" autocmd Filetype typescript let errorformat = &errorformat
"" autocmd Filetype typescript let errorformat += &errorformat
""
"" autocmd Filetype typescript.tsx let errorformat = &errorformat

"" function setTSOptions
""
"" endfunction

"" autocmd Filetype typescript let &errorformat =
""             \ &errorformat + ',' .
""             \ '%A%f:%l:%c:%m,%-G%.%#'
"" autocmd Filetype typescript.tsx let &errorformat =
""             \ &errorformat + ',' .
""             \ '%A%f:%l:%c:%m,%-G%.%#'

"" let g:neomake_open_list = 2
let b:eslint_exe = substitute(system('npm bin') ,'\n', '', 'g') . '/eslint'
let b:neomake_eslint_exe = b:eslint_exe

let g:neomake_typescript_enabled_makers = ['eslint']

let g:startify_change_to_vcs_root = 1
let g:startify_change_to_dir = 0

"" nnoremap x :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
"" \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
"" \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
let g:LanguageClient_rootMarkers = ['*.cabal', 'stack.yaml']
let g:LanguageClient_serverCommands = { 'haskell': ['hie-wrapper'] }
let g:LanguageClient_diagnosticsSignsMax = 0
let g:LanguageClient_useVirtualText = 0

