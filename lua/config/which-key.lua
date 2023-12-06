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
    b = {
      name = "basic operations",
      ["<C-s>"] = { "<cmd>w!<cr>", "Force write" },
      ["<C-q>"] = { "<cmd>qa!<cr>", "Force quit" },
      w = { "<cmd>w<cr>", "Save" },
      q = { "<cmd>confirm q<cr>", "Quit" },
      Q = { "<cmd>confirm qall<cr>", "Quit all" },
      n = { "<cmd>enew<cr>", "New File" },
      ["|"] = { "<cmd>vsplit<cr>", "Vertical Split" },
      ["-"] = { "<cmd>split<cr>", "Horizontal Split" },
    }
  },
})

return wk
