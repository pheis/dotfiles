require'telescope'.setup{
  defaults = {
    prompt_position = "bottom",
    winblend = 0
  }
}

vim.cmd [[
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fq <cmd>Telescope quickfix<cr>
nnoremap <leader>fm <cmd>Telescope marks<cr>
nnoremap ; <cmd>Telescope git_files<cr>
]]
