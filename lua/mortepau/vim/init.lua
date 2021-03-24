local map = require('mortepau.vim.map')
local opt = require('mortepau.vim.opt')
local autocmd = require('mortepau.vim.autocmd')

-- Option specific functions
vim.set = opt.set
vim.setlocal = opt.setlocal

-- Keymap specific functions ( Recursive )
vim.map = map.map
vim.nmap = map.nmap
vim.vmap = map.vmap
vim.xmap = map.xmap
vim.smap = map.smap
vim.omap = map.omap
vim.cmap = map.cmap
vim.lmap = map.lmap
vim.imap = map.imap
vim.icmap = map.icmap
vim.tmap = map.tmap

-- Keymap specific functions ( Non-recursive )
vim.noremap = map.noremap
vim.nnoremap = map.nnoremap
vim.vnoremap = map.vnoremap
vim.xnoremap = map.xnoremap
vim.snoremap = map.snoremap
vim.onoremap = map.onoremap
vim.lnoremap = map.lnoremap
vim.inoremap = map.inoremap
vim.cnoremap = map.cnoremap
vim.icnoremap = map.icnoremap
vim.tnoremap = map.tnoremap

-- Autocmd specific functions
vim.autocmd = autocmd.autocmd
vim.augroup = autocmd.augroup
