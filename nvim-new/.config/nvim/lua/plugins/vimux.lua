return {
  "preservim/vimux",
  config = function()
    -- TODO: drop nnoremaps
    vim.cmd([[
        nnoremap <leader>vp :VimuxPromptCommand<CR>
        nnoremap <leader>vl :VimuxRunLastCommand<CR>
        ]])
  end,
}
