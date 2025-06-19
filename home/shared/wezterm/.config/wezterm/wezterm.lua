local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.window_decorations = "TITLE | RESIZE"
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = -0,
}

-- config.window_background_opacity = 0.9
-- config.macos_window_background_blur = 30

config.font = wezterm.font("FiraMono nerd font", { weight = "Regular" })
config.font_size = 16.0

-- config.keys = require("keys")

-- config.colors = require("my-colors")
config.force_reverse_video_cursor = true
if wezterm.gui.get_appearance():find("Light") then
  config.colors = require("kanso-pearl")
else
  config.colors = require("kanso-ink")
end

config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 2000 }
config.keys = {
  {
    key = "a",
    mods = "CTRL|LEADER",
    action = wezterm.action.SendKey({ key = "a", mods = "CTRL" }), -- send keys CTRL-A
  },
  {
    key = "f",
    mods = "CTRL|CMD",
    action = wezterm.action.ToggleFullScreen,
  },
  -- Split vertically (e.g., LEADER + -)
  {
    key = '"',
    mods = "LEADER",
    action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
  },
  -- Split horizontally (e.g., LEADER + \)
  {
    key = "%",
    mods = "LEADER",
    action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
  },
  -- Navigate panes (e.g., LEADER + h, j, k, l for left, down, up, right)
  {
    key = "h",
    mods = "LEADER",
    action = wezterm.action.ActivatePaneDirection("Left"),
  },
  {
    key = "j",
    mods = "LEADER",
    action = wezterm.action.ActivatePaneDirection("Down"),
  },
  {
    key = "k",
    mods = "LEADER",
    action = wezterm.action.ActivatePaneDirection("Up"),
  },
  {
    key = "l",
    mods = "LEADER",
    action = wezterm.action.ActivatePaneDirection("Right"),
  },

  -- Zoom pane (e.g., LEADER + m)
  { key = "z", mods = "LEADER", action = wezterm.action.TogglePaneZoomState },

  -- Pane Select (e.g., LEADER + o)
  { key = "o", mods = "LEADER", action = wezterm.action.PaneSelect({}) },

  -- Create new tab (e.g., LEADER + c)
  {
    key = "c",
    mods = "LEADER",
    action = wezterm.action.SpawnTab("CurrentPaneDomain"),
  },

  -- Next tab (e.g., LEADER + n)
  {
    key = "n",
    mods = "LEADER",
    action = wezterm.action.ActivateTabRelative(1),
  },
  -- Previous tab (e.g., LEADER + p)
  {
    key = "p",
    mods = "LEADER",
    action = wezterm.action.ActivateTabRelative(-1),
  },
}

config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true

config.show_new_tab_button_in_tab_bar = false
config.use_fancy_tab_bar = false

wezterm.on("update-right-status", function(window, pane)
  -- Each element holds the text for a cell in a "powerline" style << fade
  local cells = {}
  table.insert(cells, " ")

  local battery_icons = {
    [100] = "\u{f240}", --  full
    [75] = "\u{f241}", --  three_quarters
    [50] = "\u{f242}", --  half
    [25] = "\u{f243}", --  one_quarter
    [0] = "\u{f244}", --  empty
  }

  local function get_battery_icon(percentage)
    if percentage >= 95 then
      return battery_icons[100]
    end
    if percentage >= 75 then
      return battery_icons[75]
    end
    if percentage >= 50 then
      return battery_icons[50]
    end
    if percentage >= 25 then
      return battery_icons[25]
    end
    return battery_icons[0]
  end

  for _, b in ipairs(wezterm.battery_info()) do
    local percentage = b.state_of_charge * 100
    local icon = get_battery_icon(percentage)
    table.insert(cells, string.format("%s  %.0f%%", icon, percentage))
  end

  -- I like my date/time in this style: "Wed Mar 3 08:14"
  local date = wezterm.strftime("%a %b %-d %H:%M:%S")
  table.insert(cells, date)

  -- The powerline < symbol
  local LEFT_ARROW = utf8.char(0xe0b3)
  -- The filled in variant of the < symbol
  local SOLID_LEFT_ARROW = utf8.char(0xe0b2)

  -- Color palette for the backgrounds of each cell
  local colors = {
    "#14171d",
    "#14171d",
    "#14171d",
    "#14171d",
    "#C4B28A",
    "#C4746E",
    "#8A9A7B",
    "#14171d",
    "#000000",
    "#14171d",
    "#14171d",
    "#14171d",
  }

  -- Foreground color for the text across the fade
  -- local text_fg = "#c0c0c0"
  local text_fg = "#C5C9C7"
  -- local text_fg = "#14171d"
  -- The elements to be formatted
  local elements = {}
  -- How many cells have been formatted
  local num_cells = 0

  -- Translate a cell into elements
  function push(text, is_last)
    local cell_no = num_cells + 1
    table.insert(elements, { Foreground = { Color = text_fg } })
    table.insert(elements, { Background = { Color = colors[cell_no] } })
    table.insert(elements, { Text = " " .. text .. " " })
    if not is_last then
      table.insert(elements, { Foreground = { Color = colors[cell_no + 1] } })
      table.insert(elements, { Text = SOLID_LEFT_ARROW })
    end
    num_cells = num_cells + 1
  end

  while #cells > 0 do
    local cell = table.remove(cells, 1)
    push(cell, #cells == 0)
  end

  window:set_right_status(wezterm.format(elements))
end)

return config
