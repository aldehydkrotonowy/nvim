vim.g.mapleader = " "      --- this is global
vim.g.maplocalleader = ' ' --- localleader is meant for a specific buffer
vim.g.icons_enabled = true

vim.opt.number = true

-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

vim.api.nvim_set_keymap('n', '<leader>qx', ':q!<CR>', { noremap = true })
