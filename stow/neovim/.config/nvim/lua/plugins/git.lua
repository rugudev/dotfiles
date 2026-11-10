return {
  -- Gutter signs for added/changed/deleted lines, and inline blame for the
  -- line under the cursor. No keymaps; staging happens in lazygit.
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      current_line_blame = true,
      current_line_blame_opts = {
        delay = 100,
        virt_text_pos = 'eol',
      },
      current_line_blame_formatter = '<author>, <author_time:%R> · <summary>',
    },
  },

  -- Side-by-side diffs, file history, and a three-way merge tool
  {
    'sindrets/diffview.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    cmd = { 'DiffviewOpen', 'DiffviewClose', 'DiffviewFileHistory', 'DiffviewToggleFiles' },
    keys = {
      { '<leader>gd', '<cmd>DiffviewOpen<cr>', desc = 'Diff working tree (merge tool when conflicted)' },
      { '<leader>gs', '<cmd>DiffviewOpen --staged<cr>', desc = 'Diff staged changes' },
      { '<leader>gf', '<cmd>DiffviewOpen -- %<cr>', desc = 'Diff current file' },
      { '<leader>gc', '<cmd>DiffviewClose<cr>', desc = 'Close diffview' },
      { '<leader>gh', '<cmd>DiffviewFileHistory %<cr>', desc = 'History of current file' },
      { '<leader>gh', ":'<,'>DiffviewFileHistory<cr>", mode = 'v', desc = 'History of selected lines' },
      { '<leader>gH', '<cmd>DiffviewFileHistory<cr>', desc = 'History of repository' },
    },
    opts = {
      enhanced_diff_hl = true,
      view = {
        -- ours | result | theirs, with base available via the file panel
        merge_tool = { layout = 'diff3_horizontal', disable_diagnostics = true },
      },
    },
  },
}
