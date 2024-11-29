return {
  'lewis6991/gitsigns.nvim',
  lazy = false,
  opts = {
    current_line_blame = true,
    signcolumn = true,
  },
  keys = {
    { '<leader>ph', ':Gitsigns preview_hunk<CR>' },
  }
}
