local builtin = require('telescope.builtin')

--- Processes
--- 1. Execute `:Telescope github pull_request`
--- 2. Load telescope.nvim
--- 3. Initialize telescope with `require('telescope').setup({ extensions = { ... } })`
--- 4. Execute `require('telescope').load_extension('github')`
--- 5. Execute `require('telescope._extensions.github')`
--- 6. Load telescope-github.nvim
--- 7. Initialize telescope-github.nvim with `require('telescope._extensions.github').setup({ ... })`
--- 8. Continue `:Telescope github pull_request`
return {
  {
    'nvim-telescope/telescope-github.nvim',
    lazy = true,
  },
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    cmd = { "Telescope" },
    opts = {
      defaults = {
        layout_strategy = 'vertical',
      },
      pickers = {
        find_files = {
          hidden = true,
        },
      },
      extensions = {
        github = {
        },
      },
    },
    keys = {
      { '<leader>ff', builtin.find_files, desc = 'Telescope find files' },
      { '<leader>gf', builtin.git_files, desc = 'Telescope git files' },
      { '<leader>fg', builtin.live_grep, desc = 'Telescope live grep' },
      { '<leader>fb', builtin.buffers, desc = 'Telescope buffers' },
      { '<leader>fh', builtin.help_tags, desc = 'Telescope help tags' },
    },
  },
}
