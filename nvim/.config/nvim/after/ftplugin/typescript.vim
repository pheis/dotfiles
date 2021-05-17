setlocal expandtab
setlocal shiftwidth=2
setlocal tabstop=2
setlocal softtabstop=2

setlocal makeprg=npx\ tsc

autocmd Filetype typescript let &errorformat =
            \ &errorformat . ',' .
            \ '%A%f:%l:%c:%m,%-G%.%#'
autocmd Filetype typescript.tsx let &errorformat =
            \ &errorformat . ',' .
            \ '%A%f:%l:%c:%m,%-G%.%#'

autocmd Filetype typescript let &makeprg = "(npx tsc && npx eslint --quiet --format unix 'src/**/*.{ts,tsx}')"
autocmd Filetype typescript.tsx let &makeprg = "(npx tsc && npx eslint --quiet --format unix 'src/**/*.{ts,tsx}')"
