vim.g.mapleader = " "

require("plugins")

require("p.togglers")
require("p.ts-run")
require("p.alternative-file")
require("p.alt-file")
require("p.keys")
require("p.reload")

vim.cmd("colo gruvbox")

vim.opt.laststatus = 3
