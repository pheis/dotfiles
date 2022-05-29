local gs = require('gitsigns')

gs.setup()

local function nmap(keys, fn)
  vim.keymap.set('n', keys, fn)
end

nmap('[c', gs.prev_hunk)
nmap(']c', gs.next_hunk)
nmap('gU', ':Gitsigns reset_hunk<CR>')
