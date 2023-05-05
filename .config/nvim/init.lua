local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stble release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require("lazy").setup("plugins", { ui = { border = "rounded" } }) -- INFO: Install awesome plugins
require("editor_settings")
require("keymaps")
require("plugins.configs.lsp_mason")
require("plugins.configs.nvim_colorizer") -- Configure colorizer WARN: It must be done after configuring color scheme
require("custom.ros")
