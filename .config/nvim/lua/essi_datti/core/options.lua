vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.relativenumber = true
opt.number = true

opt.ignorecase = true
opt.smartcase = true

opt.termguicolors = true
opt.clipboard:append("unnamedplus")

vim.g.mapleader = " "

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

opt.signcolumn = "yes"

opt.undofile = true

opt.updatetime = 250
