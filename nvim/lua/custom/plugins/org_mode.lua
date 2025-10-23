return {
  {
    'nvim-orgmode/orgmode',
    config = function()
      require('orgmode').setup({})
    end,
  },
  {
    'akinsho/org-bullets.nvim',
    opts = {
      symbols = {
        checkboxes = {
          half = { "", "OrgTSCheckboxHalfChecked" },
          done = { "✓", "OrgDone" },
          todo = { "˟", "OrgTODO" },
        },
        headlines = {
          "󱥸", "󱥸", "󱥸", "󱥸"
        },
      },
    },
    config = function(_, opts)
      require('org-bullets').setup(opts)
    end,
  },
}
