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

require("lazy").setup("plugins")
require("editor_settings")
require("keymaps")
require("plugins.configs.lsp_mason")   -- TODO: Figure out a way to clean this one up!
require("colorizer").setup()           -- FIXME: Move to a separate file to be loaded after. The problem is that it needs to be run after the editor settings!
