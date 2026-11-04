return {
  'williamboman/mason-lspconfig.nvim',
  dependencies = { 'williamboman/mason.nvim', 'neovim/nvim-lspconfig' },
  config = function()
    require('mason').setup()
    -- Diagnostics config
    vim.diagnostic.config({
      virtual_text = true,
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
    })

    -- Buffer-local LSP keymaps.
    -- Neovim already maps K, gra, gri, grn, grr, grt, gO, [d, ]d and
    -- insert-mode <C-s>; only additions and convenience aliases live here.
    local on_attach = function(event)
      local opts = { silent = true, buffer = event.buf }
      local keymap = vim.keymap.set
      keymap('n', 'gd', vim.lsp.buf.definition, vim.tbl_extend('force', opts, { desc = 'Goto definition' }))
      keymap('n', 'gD', vim.lsp.buf.declaration, vim.tbl_extend('force', opts, { desc = 'Goto declaration' }))
      keymap('n', '<C-k>', vim.lsp.buf.signature_help, vim.tbl_extend('force', opts, { desc = 'Signature help' }))
      keymap('n', '<leader>rn', vim.lsp.buf.rename, vim.tbl_extend('force', opts, { desc = 'Rename symbol' }))
      keymap({ 'n', 'x' }, '<leader>ca', vim.lsp.buf.code_action, vim.tbl_extend('force', opts, { desc = 'Code action' }))
      keymap('n', '<leader>e', vim.diagnostic.open_float, vim.tbl_extend('force', opts, { desc = 'Line diagnostics' }))
      keymap('n', '<leader>q', vim.diagnostic.setloclist, vim.tbl_extend('force', opts, { desc = 'Diagnostics to loclist' }))

      local client = vim.lsp.get_client_by_id(event.data.client_id)
      if client and client:supports_method('textDocument/inlayHint', event.buf) then
        vim.lsp.inlay_hint.enable(true, { bufnr = event.buf })
        keymap('n', '<leader>i', function()
          local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf })
          vim.lsp.inlay_hint.enable(not enabled, { bufnr = event.buf })
        end, vim.tbl_extend('force', opts, { desc = 'Toggle inlay hints' }))
      end
    end

    vim.lsp.config('lua_ls', { settings = { Lua = { diagnostics = { globals = { 'vim' } } } } })
    vim.lsp.config('gopls', {
      settings = {
        gopls = {
          semanticTokens = true,
          hints = {
            assignVariableTypes = true,
            compositeLiteralFields = true,
            compositeLiteralTypes = true,
            constantValues = true,
            functionTypeParameters = true,
            parameterNames = true,
            rangeVariableTypes = true,
          },
        },
      },
    })

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = on_attach,
    })

    require('mason-lspconfig').setup {
      ensure_installed = { 'lua_ls', 'gopls' },
      automatic_enable = true,
    }
  end
}
