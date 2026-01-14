-- Telescope
return{
  {
    'nvim-telescope/telescope.nvim', tag = 'v0.2.1',
    dependencies = {
      'nvim-lua/plenary.nvim',
      -- optional but recommended
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    }
  },
  'nvim-telescope/telescope-ui-select.nvim',
  config = function()
    require("telescope").setup({
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown {
          }
        }
      }
    })
  end
}
