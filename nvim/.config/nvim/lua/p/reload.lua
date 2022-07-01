local function _1_()
  local function _2_()
    return print(vim.fn.expand("%"))
  end
  return vim.schedule(_2_)
end
return vim.api.nvim_create_autocmd("BufWritePost", {pattern = {"*.fnl"}, callback = _1_})
