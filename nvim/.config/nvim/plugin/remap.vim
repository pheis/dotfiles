let mapleader=" "
nnoremap c* *Ncgn


nnoremap <leader>q :q<CR>
nnoremap <leader>w :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>:w<CR>


nnoremap <leader><leader> :

nnoremap <leader>y "+y
nnoremap <leader>p "+p

nnoremap g; :Denite buffer<CR>
nnoremap ; :Denite file/old file/rec<CR>

nnoremap gb :bp<CR>
nnoremap gB :bn<CR>

vnoremap // y/<C-R>"<CR>

nnoremap <leader>aj :ALENext<CR>
nnoremap <leader>ak :ALEPrevious<CR>
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

tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-l> <C-\><C-n><C-w>l
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k

nnoremap <leader>8 :<C-u>DeniteCursorWord grep:. -mode=normal<CR>
nnoremap <leader>f :<C-u>Denite grep:. -mode=normal<CR>
nnoremap <leader>b :Denite file/old<CR>

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

function! BreakHere()
	s/^\(\s*\)\(.\{-}\)\(\s*\)\(\%#\)\(\s*\)\(.*\)/\1\2\r\1\4\6
	call histdel("/", -1)
endfunction

nnoremap S :<C-u>call BreakHere()<CR>
