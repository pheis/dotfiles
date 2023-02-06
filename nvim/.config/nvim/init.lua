vim.g.mapleader = " "

require("plugins")

require("p.togglers")
require("p.ts-run")
require("p.alternative-file")
require("p.alt-file")
require("p.keys")
require("p.reload")

require("keys")

vim.cmd("colo gruvbox")

-- require 'config.cmp'


vim.opt.laststatus = 3
