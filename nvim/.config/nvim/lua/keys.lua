local tbl = require "utils/tbl"
local merge = tbl.merge
local mapKeys = tbl.mapKeys
local mapValues = tbl.mapValues

local cmd = function(str)
  return function()
    vim.cmd(str)
  end
end

local leaderMappings = {
  -- "" space space to like spacemacs
  ["<leader>"] = ":",
  ["m"] = cmd "make",
  ["w"] = cmd "write",
  -- ["fa"] = cmd("write"),
  -- ...telescope.leaderMappings,
}

local keyMappings = {
  ["yon"] = function()
    vim.cmd "set invnumber"
    vim.cmd "set invrelativenumber"
  end,
  ["yoh"] = cmd("set invhlsearch"),
  ["yod"] = toggle_diagnostics,
  ["yob"] = toggle_bg,

  ["]q"] = cmd("cnext"),
  ["[q"] = cmd("cprev"),
}

local normalMappings = merge(
  keyMappings,
  mapKeys(leaderMappings, function(key)
    return "<leader>" .. key
  end)
)

forEach(entries(normalMappings), nmap)
