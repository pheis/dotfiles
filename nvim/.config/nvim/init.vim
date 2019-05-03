call plug#begin('~/.local/share/nvim/plugged')

"" Plug 'scrooloose/nerdtree'

Plug 'valloric/MatchTagAlways'
Plug 'Raimondi/delimitMate'

Plug 'airblade/vim-gitgutter'

"" Plug 'leafgarland/typescript-vim'
Plug 'HerringtonDarkholme/yats.vim'

"" Check this at some point:
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}

Plug 'skywind3000/asyncrun.vim'

Plug 'rust-lang/rust.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/denite.nvim'

Plug 'benmills/vimux'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'chrisbra/Colorizer'

Plug 'Vimjas/vim-python-pep8-indent'  "" Fix python indentation

Plug 'morhetz/gruvbox'
Plug 'icymind/NeoSolarized'
Plug 'srcery-colors/srcery-vim'
Plug 'chriskempson/base16-vim'
Plug 'dracula/vim'
Plug 'jnurmine/zenburn'
Plug 'sjl/badwolf'

Plug 'tpope/vim-abolish'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-unimpaired'

Plug 'AndrewRadev/splitjoin.vim'

Plug 'junegunn/goyo.vim'

Plug 'mhinz/vim-startify'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'rhysd/vim-clang-format'

"" Plug 'rstacruz/vim-closer'

"" Plug 'justinmk/vim-sneak'
"" Plug 'wellle/targets.vim'
"" Plug 'michaeljsmith/vim-indent-object'

Plug 'w0rp/ale'
call plug#end()

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
vnoremap o "vy :call VimuxSlime()<CR>


" " LSP
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rls'],
    \ 'javascript': ['/Users/pyry/utils/javascript-typescript-langserver/lib/language-server-stdio'],
    \ 'javascript.jsx': ['/Users/pyry/utils/javascript-typescript-langserver/lib/language-server-stdio'],
    \ 'python': ['pyls'],
    \ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
"" set autochdir

"" Plugin Options
"" let g:rainbow_active = 0


"" ALE

let g:airline#extensions#ale#enabled = 1

let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
"" let g:ale_linters = { 'cpp': ['clang', 'gcc', 'cppcheck'] }
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 1

" Ale linter / fixers
let g:ale_linters = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'typescript': ['eslint', 'tslint', 'tsserver'],
\   'javascript': ['eslint'],
\}
let g:ale_fixers = {
  \   'typescript': [
  \       'tslint',
  \       'prettier',
  \   ],
  \}

let g:ale_fix_on_save = 1
" Set this. Airline will handle the rest.
"" let g:airline#extensions#ale#enabled = 1
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_lint_on_text_changed = 1
let g:ale_echo_msg_format = '%linter%: %s'
" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1

"" AIRLINE

let g:airline_detect_modified=1


"" DEOPLETE

let g:deoplete#enable_at_startup = 1
""let g:ycm_global_ycm_extra_conf = '~/.config/nvim/.ycm_extra_conf.py'

"" GOYO
let g:goyo_linenr = 1
let g:goyo_height = 100

call denite#custom#option('default', {
    \ 'prompt': '❯'
    \ })

"" call denite#custom#var('file/rec', 'command',
"" \ ['rg', '--files', '--glob', '!.git'])
" Change ignore_globs
call denite#custom#filter('matcher/ignore_globs', 'ignore_globs',
      \ [ '.git/', '__snapshots__/', '__pycache__/',
      \   'venv/', 'images/', '*.min.*', 'imgages/', 'fonts/'])

call denite#custom#var('file_rec', 'command',
    \ ['rg', '--files', '--glob', '!.git', ''])
call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts',
    \ ['--hidden', '--vimgrep', '--no-heading', '-S', '-g', '!*.snap'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

call denite#custom#map(
      \ 'insert',
      \ '<C-n>',
      \ '<denite:move_to_next_line>',
      \ 'noremap'
      \)
call denite#custom#map(
      \ 'insert',
      \ '<C-p>',
      \ '<denite:move_to_previous_line>',
      \ 'noremap'
      \)


"" set textwidth=80
