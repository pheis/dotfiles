(vim.api.nvim_create_autocmd :BufWritePost {
  :pattern [ "*.fnl" ]
  :callback #(vim.schedule #(print (vim.fn.expand "%")))})
