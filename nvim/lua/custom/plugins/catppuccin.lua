return {
  {
    "catppuccin/nvim",
    name = 'catppuccin',
    config = function()
      require('catppuccin').setup({
        integrations = {
          treesitter = true,
          telescope = true,
        },
        transparent_background = true,
      })
    end,
  },
}
