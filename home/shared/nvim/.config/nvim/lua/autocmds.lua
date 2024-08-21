local function augroup(name)
  return vim.api.nvim_create_augroup("my_own_autocmds" .. name, { clear = true })
end

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = augroup("env_filetype"),
  pattern = { "*.env", ".env.*" },
  callback = function()
    vim.opt_local.filetype = "sh"
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "typescript,typescriptreact",
  group = augroup("tsc"),
  command = "compiler tsc | setlocal makeprg=npx\\ tsc\\ --noEmit",
})
