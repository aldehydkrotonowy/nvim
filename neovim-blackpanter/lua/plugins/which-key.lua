return {
  'folke/which-key.nvim',
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    if vim.fn.argc(-1) == 1 then
      local stat = vim.loop.fs_stat(vim.fn.argv(0))
      if stat and stat.type == "directory" then
        require("neo-tree")
      end
    end
  end,
  opts = {
    icons = {
      group = vim.g.icons_enabled and "" or "+",
      separator = ""
    },
    disable = { filetypes = { "TelescopePrompt" } },
  },
  config = function()
    local mappings = {

      ["<leader>"] = {
        s = {},
        f = {
          name = "🔍 find",
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
        },
        c = {
          name = "test",
          e = {
            function() require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() }) end,
            "Explorer NeoTree (cwd)",
          },
          -- p = function() require("neo-tree.command").execute({ "toggle_preview", config = { use_float = false, use_image_nvim = true } }) end,
        }
      }

    }
    -- default options
    local opts = {
      mode = "n", -- NORMAL mode
      -- prefix: use "<leader>f" for example for mapping everything related to finding files
      -- the prefix is prepended to every mapping part of `mappings`
      prefix = "",
      buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
      silent = true,  -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = false, -- use `nowait` when creating keymaps
      expr = false,   -- use `expr` when creating keymaps
    }
    local wk = require("which-key")
    wk.register(mappings, opts)
  end
}
