vim.cmd([[
autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <leader>ak <Plug>(coc-diagnostic-prev)
nmap <leader>aj <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap K :call CocAction('doHover')<CR>
]])
