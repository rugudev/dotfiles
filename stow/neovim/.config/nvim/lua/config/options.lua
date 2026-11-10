vim.opt.clipboard = 'unnamedplus'
vim.opt.swapfile = false
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.list = true
vim.opt.listchars = { tab = '  ', trail = '@' }
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'yes'
vim.opt.foldlevelstart = 99 -- Tree-sitter folds available but open by default
vim.opt.undofile = true     -- persistent undo across sessions
vim.opt.ignorecase = true   -- case-insensitive search...
vim.opt.smartcase = true    -- ...unless the pattern has uppercase
vim.opt.scrolloff = 8       -- keep context lines above/below the cursor
vim.opt.splitright = true   -- vertical splits open to the right
vim.opt.splitbelow = true   -- horizontal splits open below

-- Catppuccin ships with Neovim >= 0.12 as a bundled colorscheme
-- (Latte when background=light, Mocha when dark), so no plugin is needed.
vim.cmd.colorscheme('catppuccin')
