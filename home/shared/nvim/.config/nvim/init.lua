vim.g.mapleader = " "

local install_lazy = function()
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

  vim.opt.rtp:prepend(lazypath)
end
install_lazy()

local function is_array(t)
  if type(t) ~= "table" then
    return false
  end

  local maxIndex = 0
  local count = 0

  for k, _ in pairs(t) do
    if type(k) ~= "number" or k <= 0 or math.floor(k) ~= k then
      return false
    end

    maxIndex = math.max(maxIndex, k)
    count = count + 1
  end

  return count == maxIndex -- No gaps if count equals highest index
end

local get_plugin_cfgs = function()
  local dir = vim.fn.stdpath("config") .. "/lua"
  local file_names = vim.fs.dir(dir)

  local plugins = {}

  for file_name in file_names do
    local wo_suffix = file_name:gsub("%.lua$", "")
    local plugin = require(wo_suffix)

    if is_array(plugin) then
      for _, v in ipairs(plugin) do
        table.insert(plugins, v)
      end
    else
      table.insert(plugins, plugin)
    end
  end

  return plugins
end

require("lazy").setup(get_plugin_cfgs())
