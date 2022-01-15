require("telescope").setup({})

vim.cmd([[
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fq <cmd>Telescope quickfix<cr>
nnoremap <leader>fm <cmd>Telescope marks<cr>
nnoremap <leader>ao <cmd>Telescope lsp_code_actions theme=cursor<cr>
nnoremap <leader>ar <cmd>Telescope lsp_references<cr>
nnoremap ; <cmd>Telescope find_files<cr>
]])
