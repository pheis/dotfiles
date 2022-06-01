local function nmap(k, fn)
  vim.keymap.set('n', ',' .. k, fn)
end

nmap('<leader>m', function() vim.cmd('make') end)

nmap('<leader>q', function()
  require('plenary.reload').reload_module('plugins')
  require('plenary.reload').reload_module('config')
  require('plenary.reload').reload_module("p.ts-run")
end)
