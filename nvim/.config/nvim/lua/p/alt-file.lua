local _local_1_ = require("p.utils")
local nmap = _local_1_["nmap"]
local file_mapping = {["/test/"] = "/src/", [".spec.ts"] = ".ts"}
local function substitute_many(str, subs)
  local s = str
  for k, v in pairs(subs) do
    s = s:gsub(k, v)
  end
  return s
end
local flip_tbl
local function _2_(_241)
  local tbl_12_auto = {}
  for k, v in pairs(_241) do
    local _3_, _4_ = v, k
    if ((nil ~= _3_) and (nil ~= _4_)) then
      local k_13_auto = _3_
      local v_14_auto = _4_
      tbl_12_auto[k_13_auto] = v_14_auto
    else
    end
  end
  return tbl_12_auto
end
flip_tbl = _2_
local function to_alt_file(file_name)
  local _6_ = substitute_many(file_name, file_mapping)
  if (_6_ == file_name) then
    return substitute_many(file_name, flip_tbl(file_mapping))
  elseif true then
    local _ = _6_
    return _
  else
    return nil
  end
end
local function _8_()
  return vim.cmd(("edit " .. to_alt_file(vim.fn.expand("%"))))
end
return nmap("ga", _8_)
