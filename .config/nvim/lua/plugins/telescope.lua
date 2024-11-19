return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    require('telescope').setup({
      pickers = {
        find_files = {
          hidden = true,
        }
      }
    })
    vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>', { noremap = true })
  end
}
