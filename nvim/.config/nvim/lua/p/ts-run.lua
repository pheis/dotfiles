-- Module for running typescript

local run_buffer = function()
  local file = vim.fn.expand('%')
  local cmd = 'tmux send -t left ts-node Space ' .. file .. ' C-m'
  os.execute(cmd)
end

vim.keymap.set('n', '<leader>x', run_buffer)
