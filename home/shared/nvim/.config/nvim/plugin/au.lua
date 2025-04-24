-- local group = vim.api.nvim_create_augroup("mine", {clear = true})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  -- group = group,
  pattern = { "*.env", ".env.*" },
  callback = function()
    vim.opt_local.filetype = "sh"
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "typescript,typescriptreact",
  -- group = group,
  command = "compiler tsc | setlocal makeprg=npx\\ tsc\\ --noEmit",
})
