return {
  -- Theme inspired by Atom
  'navarasu/onedark.nvim',
  priority = 1000,
  lazy = true,
  opts = {
    style = 'deep',
    -- toggle theme style ---

    -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
    toggle_style_key = '<leader>th',
    -- List of styles to toggle between
    toggle_style_list = { 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light' },
  }
  -- config = function()
  --   vim.cmd.colorscheme 'onedark'
  -- end,
}
