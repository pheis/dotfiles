local function mmap(mode)
  local function _1_(_241, _242, _243)
    return vim.keymap.set(mode, _241, _242, _243)
  end
  return _1_
end
local nmap = mmap("n")
local imap = mmap("i")
local vmap = mmap("v")
local tmap = mmap("t")
nmap("Q", "<nop>")
imap("fd", "<Esc>")
vmap("fd", "<Esc>")
tmap("fd", "<C-\\><C-n>")
nmap("<C-J>", "<C-W><C-J>")
nmap("<C-K>", "<C-W><C-K>")
nmap("<C-L>", "<C-W><C-L>")
nmap("<C-H>", "<C-W><C-H>")
nmap("<leader><leader>", ":")
vmap("//", "y/\\V<C-r>=escape(@\",'/')<CR><CR>")
vmap("/", "/\\v")
nmap("/", "/\\v")
local function _2_()
  vim.cmd("set invnumber")
  return vim.cmd("set invrelativenumber")
end
nmap("yon", _2_)
local function _3_()
  return vim.cmd("set invhlsearch")
end
nmap("yoh", _3_)
local function _4_()
  return vim.cmd("cnext")
end
nmap("]q", _4_)
local function _5_()
  return vim.cmd("cprev")
end
nmap("[q", _5_)
local function _6_()
  return vim.cmd("make")
end
nmap("<leader>m", _6_)
local function _7_()
  return vim.cmd("write")
end
return nmap("<leader>w", _7_)
