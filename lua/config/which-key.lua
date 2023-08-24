local wk = require('which-key')

wk.setup({
  icons = {
    group = vim.g.icons_enabled and "" or "+",
    separator = ""
  },
  disable = { filetypes = { "TelescopePrompt" } },
})

wk.register({
  ["<leader>"] = {
    f = {
      name = "🔍 find",
      f = { "<cmd>Telescope find_files<cr>", "Find File" },
      r = { function() return require('telescope.builtin').oldfiles end, "Open Recent File" },
      n = { "<cmd>enew<cr>", "New File" },
    },
  },
})

return wk
