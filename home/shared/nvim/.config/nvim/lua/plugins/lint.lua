local config = function()
  -- local lint = require("lint")
  --
  -- lint.linters_by_ft = {
  --   typescript = { "eslint" },
  --   tsx = { "eslint" },
  -- }

  -- InsertLeave
  -- TextChanged
  -- todo: only call lint if lint is not already running?
  -- if it is already running, postpone the next call to only call it after last
  -- lint has finished
  -- vim.api.nvim_create_autocmd({ "TextChanged" }, {
  --   callback = function()
  --     lint.try_lint()
  --   end,
  -- })
end

return {
  "mfussenegger/nvim-lint",
  config = config,
}
