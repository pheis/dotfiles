vim.g.mapleader = " "

require("plugins")

require("toggle")

require("p.ts-run")
require("p.alternative-file")
require("p.keys")

vim.cmd("colo gruvbox")

vim.opt.laststatus = 3
