vim.g.mapleader = " "

require("plugins")

require("toggle")

require("p.ts-run")
require("p.keys")

vim.cmd("colo gruvbox")

vim.opt.laststatus = 3


vim.keymap.set('n', '<leader>q', function()
  require('plenary.reload').reload_module('plugins')
  require('plenary.reload').reload_module('config')
  require('plenary.reload').reload_module("p.ts-run")
end)
