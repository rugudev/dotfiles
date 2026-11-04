vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
    vim.opt_local.expandtab = false
    vim.opt_local.list = false
  end
})

-- Format Go and fix imports through gopls before every write.
-- Requests are synchronous so the edits are in the buffer before it hits disk.
vim.api.nvim_create_autocmd("BufWritePre", {
  group = vim.api.nvim_create_augroup("UserGoFormat", {}),
  pattern = "*.go",
  callback = function(event)
    for _, client in ipairs(vim.lsp.get_clients({ bufnr = event.buf, name = "gopls" })) do
      local params = vim.lsp.util.make_range_params(0, client.offset_encoding)
      params.context = { only = { "source.organizeImports" }, diagnostics = {} }
      local response = client:request_sync("textDocument/codeAction", params, 2000, event.buf)
      for _, action in ipairs(response and response.result or {}) do
        if action.edit then
          vim.lsp.util.apply_workspace_edit(action.edit, client.offset_encoding)
        end
      end
    end
    vim.lsp.buf.format({ bufnr = event.buf, timeout_ms = 2000 })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "nix",
  callback = function()
    vim.opt_local.expandtab = true
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.shiftwidth = 2
  end
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "lua",
    callback = function()
        vim.opt_local.expandtab = true
        vim.opt_local.tabstop = 2
        vim.opt_local.softtabstop = 2
        vim.opt_local.shiftwidth = 2
    end
})
