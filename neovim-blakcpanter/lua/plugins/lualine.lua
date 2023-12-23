return {
  -- Set lualine as statusline
  'nvim-lualine/lualine.nvim',
  opts = {
    options = {
      colored = true,
      icons_enabled = true,
      theme = 'molokai',
      component_separators = '|',
      section_separators = '',
    },
  },
  config = function(opts)
    print("hello lualine", opts)
    require("lualine").setup({
      options = {
        colored = true,
        icons_enabled = true,
        theme = 'molokai',
        component_separators = '|',
        section_separators = '',
      },
    })
  end,
}
