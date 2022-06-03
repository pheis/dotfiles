local Job = require 'plenary.job'

local levenshtein_distances = {}
local function levenshtein_distance(s, t)
  local key = s < t and (s .. '||' .. t) or (t .. s)
  if (levenshtein_distances[key]) then
    return levenshtein_distances[key]
  end

  if (s:len() == 0) then
    return t:len()
  end

  if t:len() == 0 then
    return s:len()
  end

  local a = s:sub(1, 1)
  local b = t:sub(1, 1)

  local _s = s:sub(2)
  local _t = t:sub(2)

  if a == b then
    levenshtein_distance(_s, _t)
  end

  local distance = 1 + math.min(
    levenshtein_distance(a .. _s, _t), -- char is inserted (b)
    levenshtein_distance(_s, t), -- char is deleted (a)
    levenshtein_distance(_s, _t)-- char is replaced (a replaced with b)
  )

  levenshtein_distances[key] = distance

  return distance
end

local function alternative()

  local current_path = vim.api.nvim_buf_get_name(0)

  local file_name = current_path:match("^.+/(.+)$")
  file_name = file_name:match("^[^.]+")


  local function find_alt(list)
    local alt_file = nil
    local min_ed = 9999

    for _, path in pairs(list) do
      if path ~= current_path then
        local ed = levenshtein_distance(current_path, path)

        -- table.insert(eds, path, ed)

        if ed < min_ed then
          min_ed = ed
          alt_file = path
        end
      end
    end

    return alt_file
  end

  local alt_file = nil
  Job:new({
    command = 'fd',
    args = { '-a', file_name },
    on_exit = function(j) alt_file = find_alt(j:result()) end,
  }):sync()

  if not alt_file then
    return
  end

  vim.cmd('edit ' .. alt_file)
end

vim.keymap.set("n", "ga", alternative)
