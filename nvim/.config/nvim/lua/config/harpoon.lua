local ui = require("harpoon.ui")
local mark = require("harpoon.mark")
local _local_1_ = require("p.utils")
local nmap = _local_1_["nmap"]
nmap(",,", ui.toggle_quick_menu)
nmap(",m", ui.toggle_quick_menu)
for i, c in ipairs({a = "s", d = "f"}) do
  local function _2_()
    return ui.nav_file(i)
  end
  nmap(c, _2_)
end
return nil
