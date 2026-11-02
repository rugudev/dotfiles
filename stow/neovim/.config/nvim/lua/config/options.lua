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

-- Catppuccin ships with Neovim >= 0.12 as $VIMRUNTIME/colors/catppuccin.vim
-- (Latte when background=light, Mocha when dark), so no plugin is needed.
vim.cmd.colorscheme('catppuccin')
