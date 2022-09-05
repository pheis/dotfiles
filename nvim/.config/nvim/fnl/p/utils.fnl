;; key-mapping-fns {{{
(fn mmap [mode]
  (partial vim.keymap.set mode))

(local nmap
  (mmap :n))
(local imap
  (mmap :i))
(local vmap
  (mmap :v))
(local tmap
  (mmap :t))
;; }}}


;; string-utils {{{
(fn ends-with? [str ending]
  (match ending
    "" true
    _ (= ending (str:sub (- (length ending))))))
;; }}}


{
  : nmap
  : imap
  : vmap
  : tmap
  : ends-with?
}
