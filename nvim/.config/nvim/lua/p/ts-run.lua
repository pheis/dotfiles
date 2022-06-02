-- Module for running typescript

local ends_with = function(str, ending)
  return ending == "" or str:sub(- #ending) == ending
end

local is_spec_file = function()
  local file_name = vim.fn.expand('%:t')
  return ends_with(file_name, "spec.ts")
end

local tmux_send_keys = function(str)
  local cmd = str:gsub(' ', ' Space ')

  return 'tmux send -t left ' .. cmd .. ' Enter'
end

local get_test_cmd = function()
  local file_name = vim.fn.expand('%:t')
  return tmux_send_keys('npm run test -- Space ' .. file_name)
end

local get_run_cmd = function()
  local file_path = vim.fn.expand('%')
  return tmux_send_keys('ts-node Space ' .. file_path)
end

local run_buffer = function()
  local cmd = is_spec_file() and get_test_cmd() or get_run_cmd()
  os.execute(cmd)
end



vim.keymap.set('n', '<leader>x', run_buffer)

-- local visual_selection_range = function()
--   local _, csrow, cscol, _ = unpack(vim.fn.getpos("'<"))

--   local _, cerow, cecol, _ = unpack(vim.fn.getpos("'>"))

--   if csrow < cerow or (csrow == cerow and cscol <= cecol) then
--     return csrow - 1, cscol - 1, cerow - 1, cecol
--   else
--     return cerow - 1, cecol - 1, csrow - 1, cscol
--   end
-- end


-- local send_esc = function()
--   local esc = vim.api.nvim_replace_termcodes("<esc>", true, false, true)
--   vim.api.nvim_feedkeys(esc, 'x', true)
-- end

-- local print_visual_selection = function()
--   local csrow, _, cerow = visual_selection_range()

--   local cmd = 'tmux send -t left Space ' .. tostring(csrow) .. ' Space ' .. tostring(cerow)
--   send_esc()
--   os.execute(cmd)
-- end



-- vim.keymap.set('v', '<leader>r', print_visual_selection)
-- vim.keymap.set('n', '<leader>q', function() vim.cmd('so %') end)
