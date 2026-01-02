vim.g.mapleader = " "
vim.cmd([[
  filetype plugin indent on
  syntax on
]])
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.clipboard = "unnamedplus"
vim.opt.termguicolors = true
vim.opt.cmdheight = 0
vim.opt.scrolloff = 4
vim.wo.relativenumber = true
vim.opt.breakindent = true
vim.opt.formatoptions:remove("t")
vim.opt.linebreak = true
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50
vim.opt.incsearch = true
vim.opt.fillchars = { eob = " " }
vim.opt.laststatus = 3
vim.cmd([[
  augroup noAutoComment
    autocmd!
    autocmd FileType * setlocal formatoptions-=cro
  augroup END
]])
vim.o.foldcolumn = "0"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true
