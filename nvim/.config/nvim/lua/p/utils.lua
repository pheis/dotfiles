local function mmap(mode)
  local function _1_(...)
    return vim.keymap.set(mode, ...)
  end
  return _1_
end
local nmap = mmap("n")
local imap = mmap("i")
local vmap = mmap("v")
local tmap = mmap("t")
local function ends_with_3f(str, ending)
  local _2_ = ending
  if (_2_ == "") then
    return true
  elseif true then
    local _ = _2_
    return (ending == str:sub(( - #ending)))
  else
    return nil
  end
end
return {nmap = nmap, imap = imap, vmap = vmap, tmap = tmap, ["ends-with?"] = ends_with_3f}
