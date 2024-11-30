return {
  'lewis6991/gitsigns.nvim',
  -- Load the plugin lazily when reading a file or opening a new file
  lazy = true,
  event = { "BufReadPost" },
  opts = {
    current_line_blame = true,
    signcolumn = true,
  },
  keys = {
    { '<leader>ph', ':Gitsigns preview_hunk<CR>' },
  }
}
