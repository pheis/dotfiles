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

local Job = require 'plenary.job'

function M.alternative()

  local current_path = vim.api.nvim_buf_get_name(0)

  local file_name = current_path:match("^.+/(.+)$")
  file_name = file_name:match("^[^.]+")

  local function find_alt(list)
    for _, v in pairs(list) do
      if v ~= current_path then
        return v
      end
    end

    return nil
  end

  local alt_file = nil
  Job:new({
    command = 'fd',
    args = { '-a', file_name },
    on_exit = function(j) alt_file = find_alt(j:result()) end,
  }):sync()

  if not alt_file then
    return
  end

  vim.cmd('edit ' .. alt_file)
end

vim.keymap.set("n", "ga", M.alternative)

return M
