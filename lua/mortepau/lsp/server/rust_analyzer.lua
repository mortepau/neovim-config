--[[
Installation instructions:
  TODO (mortepau): Add instructions
--]]
local config = {}

config.settings = {
  ['rust-analyzer'] = {
    assist = {
      importMergeBehaviour = 'last',
      importPrefix = 'by_self',
    },
    cargo = {
      loadOutDirsFromCheck = true,
    },
    procMacro = {
      enable = true,
    },
    lens = {
      enable = true,
      methodReferences = true,
      references = true,
      debug = true,
      run = true,
      implementations = true,
    },
    inlayHints = {
      chainingHints = true,
      parameterHints = true,
      typeHints = true,
      maxLength = 25,
    },
  }
}

return config
