return {
  {
    'williamboman/mason.nvim',
    opts = {},
  },
  {
    'williamboman/mason-lspconfig.nvim',
    opts = {
      ensure_installed = {
        'lua_ls',
        'ts_ls',
        'kotlin_language_server',
      },
      handlers = {
        function (server_name)
          require('lspconfig')[server_name].setup {}
        end
      },
    },
  },
  {
    'neovim/nvim-lspconfig',
  },
}
