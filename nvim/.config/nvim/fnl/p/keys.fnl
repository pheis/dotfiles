(fn mmap [mode]
  #(vim.keymap.set mode $1 $2 $3))

;; mapping fns
(local nmap
  (mmap :n))
(local imap
  (mmap :i))
(local vmap
  (mmap :v))
(local tmap
  (mmap :t))

;; no ex mode
(nmap :Q :<nop>)

;; fd to Esc
(imap :fd :<Esc>)
(vmap :fd :<Esc>)
(tmap :fd :<C-\><C-n>)

;; Easier Moving between splits
(nmap :<C-J> :<C-W><C-J>)
(nmap :<C-K> :<C-W><C-K>)
(nmap :<C-L> :<C-W><C-L>)
(nmap :<C-H> :<C-W><C-H>)

;; "" space space to like spacemacs
(nmap :<leader><leader> ":")

;; vnoremap // y/\V<C-r>=escape(@",'/\')<CR><CR>
(vmap "//" "y/\\V<C-r>=escape(@\",'/\')<CR><CR>")

;; Very magic
(vmap :/ :/\v)
(nmap :/ :/\v)

(nmap :yon #(do
  (vim.cmd "set invnumber")
  (vim.cmd "set invrelativenumber")))

(nmap :yoh #(vim.cmd "set invhlsearch"))

(nmap "]q" #(vim.cmd :cnext))
(nmap "[q" #(vim.cmd :cprev))

(nmap :<leader>m #(vim.cmd :make))
(nmap :<leader>w #(vim.cmd :write))

;; "" save and trim white space
;; nnoremap <leader>w :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>:w<CR>
