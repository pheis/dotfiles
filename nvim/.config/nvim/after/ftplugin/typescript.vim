" setlocal expandtab
setlocal shiftwidth=2
setlocal tabstop=2
setlocal softtabstop=2

setlocal makeprg=npx\ tsc\ --noEmit\ --pretty\ false
setlocal errorformat=%+A\ %#%f\ %#(%l\\\,%c):\ %m,%C%m
