local builtin = require('telescope.builtin')

return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  opts = {
    defaults = {
      layout_strategy = 'vertical',
    },
    pickers = {
      find_files = {
        hidden = true,
      }
    }
  },
  keys = {
    { '<leader>ff', builtin.find_files, desc = 'Telescope find files' },
    { '<leader>fg', builtin.live_grep, desc = 'Telescope live grep' },
    { '<leader>fb', builtin.buffers, desc = 'Telescope buffers' },
    { '<leader>fh', builtin.help_tags, desc = 'Telescope help tags' },
  },
}
