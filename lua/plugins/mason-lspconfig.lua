return{
  "mason-org/mason-lspconfig.nvim",
  opts = {
    ensured_installed = {'ansible', 'lua_ls', 'html', 'vue_ls', 'yamlls'}
  },
  dependencies = {
    { "mason-org/mason.nvim", opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"}
        }
      } },
      "neovim/nvim-lspconfig",
    },
  }
