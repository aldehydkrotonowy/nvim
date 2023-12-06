local ll = require('lualine')


ll.setup {
  options = {
    colored = true,
    icons_enabled = true,
    theme = 'onedark',
    component_separators = '|',
    section_separators = '',
  },

}
vim.cmd.colorscheme 'onedark'

return ll
