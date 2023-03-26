vim.g.mapleader = " "

require("plugins")

require("p.togglers")
require("p.ts-run")
require("p.alternative-file")
require("p.alt-file")
require("p.keys")
require("p.reload")

require("keys")

vim.opt.termguicolors = true
vim.o.background = "dark" -- or "light" for light mode
-- vim.o.background = "light"

vim.cmd("colo gruvbox")
-- vim.cmd("colo tokyonight")
-- vim.cmd("colo catppuccin-latte")
-- vim.cmd("colo solarized")

-- require 'config.cmp'


vim.opt.laststatus = 3
