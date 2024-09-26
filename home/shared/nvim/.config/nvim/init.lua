local install_plugin_manager = function()
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

  ---@diagnostic disable-next-line: undefined-field
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
    })
  end

  ---@diagnostic disable-next-line: undefined-field
  vim.opt.rtp:prepend(lazypath)
end

local read_plugin_defs = function()
  local file_names = vim.fs.dir("~/.config/nvim/lua/plugins")

  local plugins = {}

  for file_name in file_names do
    local wo_suffix = file_name:gsub("%.lua$", "")
    local w_prefix = "plugins" .. "." .. wo_suffix
    local plugin = require(w_prefix)

    table.insert(plugins, plugin)
  end

  return plugins
end

require("options")
require("keymap")
require("autocmds")

install_plugin_manager()
require("lazy").setup(read_plugin_defs(), {})

-- after loading plugins
-- could just be after/options.lua
vim.cmd("set invnumber")
vim.cmd("set invrelativenumber")
vim.cmd("colo kanagawa-dragon")

-- TODO: map '-' on neo-tree to "Close node"
-- Currently 'C' closes node
-- --> Should be trivial
--
-- Plugins to try-out:
-- neo-test?
-- nvim-bfq
-- session manager Shatur/neovim-session-manager
--
-- THIS GOOD
-- https://github.com/yioneko/nvim-vtsls
