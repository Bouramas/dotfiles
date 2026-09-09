-- Leader must hold the raw Ctrl-S byte, not the literal text "<C-s>",
-- otherwise <leader>-based mappings won't fire on Ctrl-S.
vim.g.mapleader = vim.api.nvim_replace_termcodes("<C-s>", true, true, true)
vim.g.maplocalleader = vim.g.mapleader

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.swapfile = false
