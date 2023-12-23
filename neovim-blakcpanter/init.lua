vim.g.mapleader = " "      --- this is global
vim.g.maplocalleader = ' ' --- localleader is meant for a specific buffer
vim.g.icons_enabled = true

vim.opt.number = true

-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

vim.api.nvim_set_keymap('n', '<leader>qx', ':q!<CR>', { noremap = true })

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
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

require('lazy').setup("plugins")

vim.cmd.colorscheme 'onedark'
