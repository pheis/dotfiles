local wezterm = require 'wezterm'

local config = wezterm.config_builder()


config.window_decorations = "RESIZE"
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.show_new_tab_button_in_tab_bar = false
config.use_fancy_tab_bar = false
config.window_background_opacity = 0.9



config.color_scheme = 'Tomorrow Night (Gogh)'

config.font = wezterm.font 'FiraMono nerd font'
config.font_size = 16.0

config.keys = {
  {
    key = 'm',
    mods = 'CMD',
    action = wezterm.action.DisableDefaultAssignment,
  },
}

local rgb = function(...)
  local args = { ... }
  return "rgb(" .. table.concat(args, ",") .. ")"
end

config.colors = {
  -- The default text color
  foreground = rgb(0xd8, 0xd8, 0xd8),
  -- The default background color
  background = rgb(0x18, 0x18, 0x18),

  -- Overrides the cell background color when the current cell is occupied by the
  -- cursor and the cursor style is set to Block
  cursor_bg = '#52ad70',
  -- Overrides the text color when the current cell is occupied by the cursor
  cursor_fg = 'black',
  -- Specifies the border color of the cursor when the cursor style is set to Block,
  -- or the color of the vertical or horizontal bar when the cursor style is set to
  -- Bar or Underline.
  cursor_border = '#52ad70',

  -- the foreground color of selected text
  selection_fg = 'black',
  -- the background color of selected text
  selection_bg = '#fffacd',

  -- The color of the scrollbar "thumb"; the portion that represents the current viewport
  scrollbar_thumb = '#222222',

  -- The color of the split lines between panes
  split = '#444444',

  ansi = {
    rgb(0x18, 0x18, 0x18),
    rgb(0xac, 0x42, 0x42),
    rgb(0x90, 0xa9, 0x59),
    rgb(0xf4, 0xbf, 0x75),
    rgb(0x6a, 0x9f, 0xb5),
    rgb(0xaa, 0x75, 0x9f),
    rgb(0x75, 0xb5, 0xaa),
    rgb(0xd8, 0xd8, 0xd8),
  },
  brights = {
    rgb(0x6b, 0x6b, 0x6b),
    rgb(0xc5, 0x55, 0x55),
    rgb(0xaa, 0xc4, 0x74),
    rgb(0xfe, 0xca, 0x88),
    rgb(0x82, 0xb8, 0xc8),
    rgb(0xc2, 0x8c, 0xb8),
    rgb(0x93, 0xd3, 0xc3),
    rgb(0xf8, 0xf8, 0xf8),
  },

  -- Arbitrary colors of the palette in the range from 16 to 255
  -- indexed = { [136] = '#af8700' },

  -- Since: 20220319-142410-0fcdea07
  -- When the IME, a dead key or a leader key are being processed and are effectively
  -- holding input pending the result of input composition, change the cursor
  -- to this color to give a visual cue about the compose state.
  compose_cursor = 'orange',

  -- Colors for copy_mode and quick_select
  -- available since: 20220807-113146-c2fee766
  -- In copy_mode, the color of the active text is:
  -- 1. copy_mode_active_highlight_* if additional text was selected using the mouse
  -- 2. selection_* otherwise
  copy_mode_active_highlight_bg = { Color = '#000000' },
  -- use `AnsiColor` to specify one of the ansi color palette values
  -- (index 0-15) using one of the names "Black", "Maroon", "Green",
  --  "Olive", "Navy", "Purple", "Teal", "Silver", "Grey", "Red", "Lime",
  -- "Yellow", "Blue", "Fuchsia", "Aqua" or "White".
  copy_mode_active_highlight_fg = { AnsiColor = 'Black' },
  copy_mode_inactive_highlight_bg = { Color = '#52ad70' },
  copy_mode_inactive_highlight_fg = { AnsiColor = 'White' },

  quick_select_label_bg = { Color = 'peru' },
  quick_select_label_fg = { Color = '#ffffff' },
  quick_select_match_bg = { AnsiColor = 'Navy' },
  quick_select_match_fg = { Color = '#ffffff' },
}


return config
