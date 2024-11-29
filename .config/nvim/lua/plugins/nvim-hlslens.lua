return {
  'kevinhwang91/nvim-hlslens',
  -- Load the plugin lazily when the keybindings are used
  lazy = true,
  keys = { '/', 'n', 'N', '*', '#' },
  opts = {
    calm_down = true,
    nearest_only = true,
  },
}
