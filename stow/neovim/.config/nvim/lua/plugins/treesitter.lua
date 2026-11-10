-- Tree-sitter parsers for languages Neovim does not bundle.
-- The main branch of nvim-treesitter only installs parsers and queries;
-- highlighting, folding and indentation are enabled with core APIs below.
local languages = {
  'go', 'gomod', 'gosum', 'gowork',
  'nix', 'fish', 'bash',
  'json', 'yaml', 'toml',
  'gitcommit', 'git_config', 'diff',
}

return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  lazy = false,
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter').install(languages)

    vim.api.nvim_create_autocmd('FileType', {
      group = vim.api.nvim_create_augroup('UserTreesitter', {}),
      pattern = languages,
      callback = function(event)
        -- Skip if the parser is missing (e.g. first launch before install finishes).
        if not pcall(vim.treesitter.get_parser, event.buf) then
          return
        end
        vim.treesitter.start(event.buf)
        vim.wo[0][0].foldmethod = 'expr'
        vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        vim.bo[event.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
