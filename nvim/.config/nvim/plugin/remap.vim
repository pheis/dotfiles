nnoremap <silent>j gj
nnoremap <silent>k gk

let mapleader=" "
nnoremap c* *Ncgn


nnoremap <leader>w :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>:w<CR>


nnoremap <leader><leader> :

"" nnoremap <leader>qo :copen<CR>
"" nnoremap <leader>ql :ccl<CR>
"" nnoremap <F5> :call LanguageClient_contextMenu()<CR>
"" map <Leader>lk :call LanguageClient#textDocument_hover()<CR>
"" map <Leader>lg :call LanguageClient#textDocument_definition()<CR>
"" map <Leader>lr :call LanguageClient#textDocument_rename()<CR>
"" map <Leader>lf :call LanguageClient#textDocument_formatting()<CR>
"" map <Leader>lb :call LanguageClient#textDocument_references()<CR>
"" map <Leader>la :call LanguageClient#textDocument_codeAction()<CR>
"" map <Leader>ls :call LanguageClient#textDocument_documentSymbol()<CR>

"" ANDROID DEV

nnoremap <leader>ar :!adb shell input text "RR"<CR>
nnoremap <leader>as :!adb reverse tcp:8081 tcp:8081<CR>

nnoremap <leader>y "+y
nnoremap <leader>p "+p

"" DiffRev
nnoremap <leader>drm :DiffRev master<CR>
nnoremap <leader>dri :DiffRev Head<CR>


" GIT GUTTER
"
nmap gj <Plug>(GitGutterNextHunk)
nmap gk <Plug>(GitGutterPrevHunk)
nmap ga <Plug>(GitGutterStageHunk)
nmap gu <Plug>(GitGutterUndoHunk)
nmap gz :GitGutterFold<CR>

"" FUGITIVE
nnoremap <leader>gdm :Gdiff master<CR>
nnoremap <leader>gdi :Gdiff<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gw :Gwrite<CR>
nnoremap <leader>gr :Ggrep<Space>
nnoremap <leader>gc :Gcommit<CR>

" same bindings for merging diffs as in normal mode
xnoremap dp :diffput<CR>
xnoremap do :diffget<CR>

"" nnoremap g; :Denite buffer<CR>
"" nnoremap ; :Denite file/old file/rec<CR>
nnoremap <leader>r :Rg<CR>
nnoremap <leader>ff :GFiles<CR>
nnoremap <C-f> :GFiles<CR>
nnoremap <leader>fg :Files<CR>
nnoremap <leader>fm :Marks<CR>
nnoremap <leader>fr :Rg<CR>
nnoremap <leader>; :GFiles<CR>
nnoremap ; :GFiles<CR>
nnoremap g; :call fzf#run({'source': 'git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format="%(refname:short)"', 'sink': 'Git checkout'})<CR>

"" nnoremap ; :Denite file/old file/rec<CR>

map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T

"" nnoremap yoa :ALEToggle<CR>


nnoremap gb :bp<CR>
nnoremap gB :bn<CR>

vnoremap // y/<C-R>"<CR>

"" nnoremap <leader>aj :ALENext<CR>
"" nnoremap <leader>ak :ALEPrevious<CR>
nnoremap <leader>o :Goyo<CR>

nnoremap [ol :set linebreak<CR>
nnoremap ]ol :set nolinebreak<CR>

inoremap fd <Esc>
vnoremap fd <Esc>
tnoremap fd <C-\><C-n>

nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k


"" tnoremap <C-h> <C-\><C-n><C-w>h
"" tnoremap <C-l> <C-\><C-n><C-w>l
"" tnoremap <C-j> <C-\><C-n><C-w>j
"" tnoremap <C-k> <C-\><C-n><C-w>k

"" nnoremap <leader>8 :<C-u>DeniteCursorWord grep:. -mode=normal<CR>
"" nnoremap <leader>f :<C-u>Denite grep:. -mode=normal<CR>
"" nnoremap <leader>b :Denite file/old<CR>

nnoremap <C-s> :ToggleResizeMode<CR>
tnoremap <C-s> <C-\><C-n>:ToggleResizeMode<CR>

nnoremap <leader>vp :VimuxPromptCommand<CR>
nnoremap <leader>vl :VimuxRunLastCommand<CR>

" Move lines
nnoremap <M-k> :m .-2<CR>==
nnoremap <M-j> :m .+1<CR>==
vnoremap <M-j> :m '>+1<CR>gv=gv
vnoremap <M-k> :m '<-2<CR>gv=gv

" Look for the selection, very nice trick
vnoremap // y/\V<C-r>=escape(@",'/\')<CR><CR>

" Very magic
vnoremap / /\v
nnoremap / /\v

"" function! BreakHere()
"" 	s/^\(\s*\)\(.\{-}\)\(\s*\)\(\%#\)\(\s*\)\(.*\)/\1\2\r\1\4\6
"" 	call histdel("/", -1)
"" endfunction
""
"" nnoremap S :<C-u>call BreakHere()<CR>

"" function! ToggleQuickFix()
""   if exists("g:qwindow_toggler")
""     cclose
""     unlet g:qwindow_toggler
""   else
""     try
""       copen
""       let g:qwindow_toggler = 1
""     catch
""       echo "No Errors found!"
""     endtry
""   endif
"" endfunction

"" nmap <script> <silent> <leader>q :call ToggleQuickFix()<CR> nnoremap <leader>q :copen<CR>


nnoremap <leader>e :Neomake!<CR>

function! NextHunkAllBuffers()
  let line = line('.')
  GitGutterNextHunk
  if line('.') != line
    return
  endif

  let bufnr = bufnr('')
  while 1
    bnext
    if bufnr('') == bufnr
      return
    endif
    if !empty(GitGutterGetHunks())
      normal! 1G
      GitGutterNextHunk
      return
    endif
  endwhile
endfunction

function! PrevHunkAllBuffers()
  let line = line('.')
  GitGutterPrevHunk
  if line('.') != line
    return
  endif

  let bufnr = bufnr('')
  while 1
    bprevious
    if bufnr('') == bufnr
      return
    endif
    if !empty(GitGutterGetHunks())
      normal! G
      GitGutterPrevHunk
      return
    endif
  endwhile
endfunction

"" nmap <silent> ]c :call NextHunkAllBuffers()<CR>
"" nmap <silent> [c :call PrevHunkAllBuffers()<CR>
" Use `[c` and `]c` to navigate diagnostics
"
nmap <leader>ak <Plug>(coc-diagnostic-prev)
nmap <leader>aj <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
