local M = {}

function M.toggle_bg()
  local bg = vim.o.background == "dark" and "light" or "dark"
  vim.o.background = bg
end

return M
