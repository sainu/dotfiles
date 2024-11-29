return {
  'kevinhwang91/nvim-hlslens',
  -- Load the plugin lazily when the keybindings are used
  lazy = true,
  keys = { '/', 'n', 'N', '*', '#' },
  opts = function()
    -- Use hlslens with nvim-scrollbar
    require('scrollbar.handlers.search').setup({
      -- Override configuration of hlslens
      calm_down = true,
      nearest_only = true,
    })
  end,
}
