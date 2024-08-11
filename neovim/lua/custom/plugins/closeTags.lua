-- Automatically closes html tags

return {
  'windwp/nvim-ts-autotag',
  require('nvim-treesitter.configs').setup {
    autotag = {
      enable = true,
    },
  },
}
