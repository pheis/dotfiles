vim.g.mapleader = " "

require("plugins")

require("p.togglers")
require("p.ts-run")
require("p.alternative-file")
require("p.keys")

vim.cmd("colo gruvbox")

vim.opt.laststatus = 3
