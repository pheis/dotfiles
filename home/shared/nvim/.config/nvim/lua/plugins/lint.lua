local config = function ()
  local lint = require('lint')

  lint.linters_by_ft = {
    typescript = {"eslint"},
    tsx = {"eslint"}
  }

  vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    lint.try_lint()
  end,
})
end

return {
  "mfussenegger/nvim-lint",
  config = config,
}
