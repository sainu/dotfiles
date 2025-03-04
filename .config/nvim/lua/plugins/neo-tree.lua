return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  opts = {
    close_if_last_window = true,
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = true,
        never_show = {
          ".DS_Store",
        },
      },
      follow_current_file = {
        enabled = true,
      },
    },
  },
  keys = {
    { '<leader>e', ':Neotree filesystem focus left<CR>', noremap = true }
  },
}
