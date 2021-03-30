--[[
Requirements:
  clangd
  go
Installation instructions:
  git clone https://github.com/arduino/arduino-language-server
  go build
--]]
local config = {}

config.cmd = { vim.fn.expand('$HOME/src/arduino-language-server/arduino-language-server') }

return config
