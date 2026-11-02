return {
  -- Airline
  {
    'vim-airline/vim-airline',
    init = function()
      vim.g.airline_powerline_fonts = 1
      -- vim-airline ships only the 'dark' theme; the rest live in the separate
      -- vim-airline-themes plugin.
      vim.g.airline_theme = 'dark'
    end,
  },
}
