require("telescope").setup({})

vim.cmd([[
nnoremap <leader>/ <cmd>Telescope live_grep<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fq <cmd>Telescope quickfix<cr>
nnoremap <leader>m <cmd>Telescope marks<cr>
nnoremap <leader>* <cmd>Telescope lsp_references<cr>
nnoremap <leader>f <cmd>Telescope find_files<cr>
nnoremap <leader>s <cmd>Telescope lsp_document_symbos<cr>
nnoremap <leader>s <cmd>Telescope lsp_document_symbols<cr>
nnoremap <leader>S <cmd>Telescope lsp_workspace_symbols<cr>
]])
-- nnoremap <leader>ao <cmd>Telescope lsp_code_actions theme=cursor<cr>
