return {
  -- Completion
  {
    'saghen/blink.cmp',
    version = '1.*',
    opts = {
      keymap = {
        preset = 'enter',
        ['<Tab>'] = { 'select_next', 'snippet_forward', 'fallback' },
        ['<S-Tab>'] = { 'select_prev', 'snippet_backward', 'fallback' },
      },
      -- Show the function signature automatically while typing inside a call
      signature = {
        enabled = true,
        window = { border = 'rounded', show_documentation = false },
      },
      -- Give popups a frame; with a transparent background they are otherwise
      -- just text drawn over the code.
      completion = {
        list = {
          selection = { preselect = false, auto_insert = false },
        },
        menu = { border = 'rounded' },
        documentation = { window = { border = 'rounded' } },
      },
    },
  },

  -- Autopairs
  { 'windwp/nvim-autopairs', config = function()
      require('nvim-autopairs').setup({})
    end
  },

  -- Vim Surround
  { 'tpope/vim-surround' },

  -- Git change indicators
  { 'lewis6991/gitsigns.nvim', opts = {} },

  -- Markdown Preview
  {
    'iamcco/markdown-preview.nvim',
    build = 'cd app && npm install',
    init = function()
      vim.g.mkdp_filetypes = { 'markdown' }
    end,
    ft = { 'markdown' },
  },

  -- CSS Color Preview
  { 'ap/vim-css-color' },

}
