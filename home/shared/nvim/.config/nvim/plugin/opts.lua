vim.o.laststatus = 3
vim.o.relativenumber = true
vim.o.number = true

vim.g.have_nerd_font = true
vim.opt.showmode = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.cursorline = true
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.clipboard = "unnamedplus"
vim.opt.completeopt = "menuone,noselect"
vim.opt.inccommand = "split"
vim.opt.mouse = "a"
vim.opt.scrolloff = 5
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

vim.o.winborder = "rounded"

vim.diagnostic.config({
  virtual_text = { current_line = true },
})
-- vim.diagnostic.config({ virtual_text = true })
