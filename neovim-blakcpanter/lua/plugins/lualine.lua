return {
  -- Set lualine as statusline
  'nvim-lualine/lualine.nvim',
  opts = {
    options = {
      colored = true,
      icons_enabled = true,
      theme = 'dracula',
      component_separators = '|',
      section_separators = '',
    },
  },
  config = function(_, opts)
    require("lualine").setup(opts)
  end,
}
