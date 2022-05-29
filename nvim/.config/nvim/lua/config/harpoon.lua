local ui = require("harpoon.ui")
local mark = require("harpoon.mark")

local function sk(k, fn)
  vim.keymap.set('n', ',' .. k, fn)
end

sk(',', ui.toggle_quick_menu)
sk('m', mark.add_file)

for i, c in ipairs({ 'a', 's', 'd', 'f' }) do
  sk(c, function() ui.nav_file(i) end)
end
