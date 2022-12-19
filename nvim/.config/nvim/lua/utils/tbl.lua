local M = {}

M.merge = function(...)
  local acc = {}

  for _, table in ipairs(...) do
    for k, v in pairs(table) do
      acc[k] = v
    end
  end

  return acc
end

M.mapKeys = function(tbl, fn)
  local acc = {}

  for k, v in pairs(tbl) do
    acc[fn(k)] = v
  end

  return acc
end

M.mapValues = function(tbl, fn)
  local acc = {}

  for k, v in pairs(tbl) do
    acc[k] = fn(v)
  end

  return acc
end


return M
