vim.opt.guicursor      = ""

vim.opt.nu             = true
vim.opt.relativenumber = true

vim.opt.tabstop        = 4
vim.opt.softtabstop    = 4
vim.opt.shiftwidth     = 4
vim.opt.expandtab      = true

vim.opt.smartindent    = true

vim.opt.wrap           = false

vim.opt.swapfile       = false
vim.opt.backup         = false
vim.opt.undodir        = os.getenv("HOME") .. "/.nvim/undodir"
vim.opt.undofile       = true

vim.opt.termguicolors  = true

vim.opt.hlsearch       = false
vim.opt.incsearch      = true
vim.opt.scrolloff      = 8
vim.signcolumn         = "yes"

vim.opt.updatetime     = 50
vim.g.mapleader        = " "

-- netrw
vim.g.netrw_localrmdir = 'rm -r'

-- folds
-- vim.opt.foldcolumn     = "4"
vim.g.netrw_keepdir = 1

vim.opt.diffopt.linematch = 50
