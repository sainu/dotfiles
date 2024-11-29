return {
  'petertriho/nvim-scrollbar',
  -- Load the plugin lazily when reading a file or opening a new file
  lazy = true,
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    handlers = {
      gitsigns = true,
      search = true,
    },
  },
}
