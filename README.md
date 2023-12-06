# nvim-conf
nvim settings


usful tutorial 
https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/
======================================================
LazyVim maps keys using function M.safe_keymap_set(mode, lhs, rhs, opts) function (defined in utils.init.lua) where:
mode (as in Vim modes like Normal/Insert mode)
lhs (the custom keybinds you need)
rhs (the commands or existing keybinds to customise)
opts (additional options like <silent>/<noremap>, see :h map-arguments for more info on it)

At the core of the wrapper is the vim.api.nvim_set_keymap() function which accepts the list of parameters mentioned above.
------------------------------------------------------------------------
from https://github.com/neovim/neovim/commit/6d41f65aa45f10a93ad476db01413abaac21f27d
This introduces two new functions `vim.keymap.set` & `vim.keymap.del`

differences compared to regular set_keymap:
- remap is used as opposite of noremap. By default it's true for <Plug> keymaps and false for others.
- rhs can be lua function.
- mode can be a list of modes.
- replace_keycodes option for lua function expr maps. (Default: true)
- handles buffer specific keymaps

Examples:
```lua
vim.keymap.set('n', 'asdf', function() print("real lua function") end)
vim.keymap.set({'n', 'v'}, '<leader>lr', vim.lsp.buf.references, {buffer=true})
vim.keymap.set('n', '<leader>w', "<cmd>w<cr>", {silent = true, buffer = 5 })
vim.keymap.set('i', '<Tab>', function()
  return vim.fn.pumvisible() == 1 and "<C-n>" or "<Tab>"
end, {expr = true})
vim.keymap.set('n', '[%', '<Plug>(MatchitNormalMultiBackward)')

vim.keymap.del('n', 'asdf')
vim.keymap.del({'n', 'i', 'v'}, '<leader>w', {buffer = 5 })
```
======================================================
vim.api is the neovim api. It has specific requirements, such as needing to be accessible by any supportable language and more importantly has a contract about what can and cannot change about it. nvim_set_keymap was made back in the 0.5 days, well before Lua was considered a full native solution from Vimscript. This means it has downsides, of which it cannot change due its api contract

This is what vim.keymap.set is for. It is a Lua exclusive interface meant to work around these issues. It is not a direct function itself. When you call vim.keymap.set, you call nvim_set_keymap with appropriate options. If you're working with Lua at all, use vim.keymap
======================================================

vim.o - general settings
vim.wo - window scope
vim.bo - buffer scope
vim.g - global varialbles (eg. mapleader)
vim.env - environment variables
vim.opt - vim.opt acts like the :set
======================================================
nnoremap - normal mode non-recursively map 
remap is an option that makes mappings work recursively. What is recursive mapping https://stackoverflow.com/questions/3776117/what-is-the-difference-between-the-remap-noremap-nnoremap-and-vnoremap-mapping

Then, we have mode-specific commands:

nmap - works recursively in normal mode.
imap - works recursively in insert mode.
vmap - works recursively in visual and select modes.
xmap - works recursively in visual mode.
smap - works recursively in select mode.
cmap - works recursively in command-line mode.
omap - works recursively in operator pending mode.
And their non-recursive variations:

nnoremap - works non-recursively in normal mode.
inoremap - works non-recursively in insert mode.
vnoremap - works non-recursively in visual and select modes.
xnoremap - works non-recursively in visual mode.
snoremap - works non-recursively in select mode.
cnoremap - works non-recursively in command-line mode.
onoremap - works non-recursively in operator pending mode.
======================================================
