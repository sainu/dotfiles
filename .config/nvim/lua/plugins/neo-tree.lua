return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  config = function()
    require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
          never_show = {
            ".DS_Store",
          },
        },
        follow_current_file = {
          enabled = true,
        },
      },
    })

    vim.keymap.set('n', '<leader>e', ':Neotree filesystem focus left<CR>', { noremap = true })
    vim.keymap.set('n', '<leader>b', ':Neotree buffers focus right<CR>', { noremap = true })
  end
}
