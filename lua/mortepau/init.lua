-- Load the custom vim logic/functions first
require('mortepau.vim')

-- Load the functions and stuff to be put in the global namespace
require('mortepau.globals')

-- Load all options
require('mortepau.options')

-- Load personal mappings
require('mortepau.mappings')

-- Load personal autocmds
require('mortepau.autocmds')

-- Load plugins
require('mortepau.plugins')

-- Load LSP configuration
require('mortepau.lsp')
