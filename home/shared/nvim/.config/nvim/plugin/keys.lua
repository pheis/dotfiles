local dark_theme = "gruvbox"
local light_theme = "solarized"
vim.cmd("colo " .. dark_theme)

local keymaps = {
  v = {
    ["<Space>"] = "<Nop>",
  },
  i = {
    fd = "<ESC>",
  },
  n = {
    ["<C-H>"] = "<C-W><C-H>",
    ["<C-J>"] = "<C-W><C-J>",
    ["<C-K>"] = "<C-W><C-K>",
    ["<C-L>"] = "<C-W><C-L>",

    ["<Space>"] = "<Nop>",
    k = { "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true } },
    j = { "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true } },

    yoh = function()
      vim.cmd("set invhlsearch")
    end,

    -- toggle numbers
    yon = function()
      vim.cmd("set invnumber")
      vim.cmd("set invrelativenumber")
    end,
    -- toggle background
    yob = function()
      if vim.o.background == "dark" then
        vim.o.background = "light"
        vim.cmd("colo " .. light_theme)
      else
        vim.o.background = "dark"
        vim.cmd("colo " .. dark_theme)
      end
    end,
    -- toggle diagnostics
    yod = (function()
      local hidden = false

      return function()
        if hidden then
          vim.diagnostic.show()
        else
          vim.diagnostic.hide()
        end

        hidden = not hidden
      end
    end)(),
  },
}

for mode, keymap in pairs(keymaps) do
  for k, v in pairs(keymap) do
    if type(v) == "table" then
      vim.keymap.set(mode, k, unpack(v))
    else
      vim.keymap.set(mode, k, v, { silent = true })
    end
  end
end
