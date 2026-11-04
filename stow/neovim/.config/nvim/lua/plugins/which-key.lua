return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts = {
    preset = 'helix',
    spec = {
      { '<leader>s', group = 'Search' },
      { '<leader>r', group = 'Refactor' },
      { '<leader>h', group = 'Git Hunk' },
      { '<leader>g', group = 'Git Diff' },
      { '<leader>t', group = 'Toggle' },
    },
  },
  keys = {
    {
      '<leader>?',
      function()
        require('which-key').show({ global = false })
      end,
      desc = 'Buffer-local keymaps',
    },
  },
}
