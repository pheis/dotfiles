local M = {}

function M.toggle_bg()
  local bg = vim.o.background == "dark" and "light" or "dark"
  vim.o.background = bg
end

--nnoremap yob :lua require'toggle'.toggle_bg()<CR>

vim.keymap.set("n", "yob", M.toggle_bg)

local is_diagnostics_hidden = false

function M.toggle_diagnostics()
  if is_diagnostics_hidden then
    vim.diagnostic.show()
  else
    vim.diagnostic.hide()
  end

  is_diagnostics_hidden = not is_diagnostics_hidden
end

vim.keymap.set("n", "yod", M.toggle_diagnostics)

return M
