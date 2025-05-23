local wezterm = require("wezterm")
-- local environment = require('environment')

-- omit c,v to copy paste :D
-- local all_characters = [[`1234567890-=qwertyuiop[]\asdfghjkl;'zxcvbnm,./]]
-- local all_characters = [[1234567890]]
-- omit c,v, w
local all_characters = [[`1234567890qertyuiop[]\asdfghjkl;'zxbnm,./]]

local characters = {}

for i = 1, #all_characters do
  table.insert(characters, all_characters:sub(i, i))
end

local function mappings(maps)
  local result = {}
  local seen = {}
  local mod_key = "CMD"

  -- if environment.os == 'mac' then
  --   mod_key = 'CMD'
  -- else
  --   mod_key = 'ALT'
  -- end

  for _, mapping in ipairs(maps) do
    mapping.mods = mapping.mods and mapping.mods:gsub("MOD", mod_key)
    table.insert(result, mapping)

    seen[mapping.mods .. " " .. mapping.key:lower()] = true
  end

  if mod_key == "CMD" then
    for _, key in ipairs(characters) do
      for _, mods in ipairs({ "CMD", "CMD|SHIFT" }) do
        local combo = mods .. " " .. key

        if not seen[combo] then
          seen[combo] = true

          table.insert(result, {
            key = key,
            mods = mods,
            action = wezterm.action.SendKey({
              key = key,
              mods = mods:gsub("CMD", "ALT"),
            }),
          })
        end
      end
    end
  end


  table.insert(result, {
    key='f',
    mods = 'CTRL|CMD',
    action = wezterm.action.ToggleFullScreen,
  })

  return result
end

return mappings({})
