local plugin = {
  ['packer.nvim'] = require('external.plugin.packer')
}

local completion = {
  ['completion-nvim'] = require('external.completion.completion_nvim')
}

local snippet = {
  ['UltiSnips'] = require('external.snippet.ultisnips')
}

local lsp = {
  ['builtin'] = require('external.lsp.builtin')
}

local statusline = {
  ['lightline'] = require('external.statusline.lightline')
}

local External = {}

function External:new(opts)
  if opts.plugin and opts.plugin.manager then
    self.plugin = plugin[opts.plugin.manager]

    if not self.plugin then
      error(string.format('External: Plugin manager %s not found', opts.plugin.manager))
    end

    self.plugin:init(opts.plugin)
  end

  if opts.lsp and opts.lsp.provider then
    self.lsp = lsp[opts.lsp.provider]

    if not self.lsp then
      error(string.format('External: LSP provider %s not found', opts.lsp.provider))
    end

    self.lsp:init(opts.lsp)
  end

  if opts.completion and opts.completion.provider then
    self.completion = completion[opts.completion.provider]

    if not self.completion then
      error(string.format('External: Completion provider %s not found', opts.completion.provider))
    end

    self.completion:init(opts.completion)
  end

  if opts.snippet and opts.snippet.provider then
    self.snippet = snippet[opts.snippet.provider]

    if not self.snippet then
      error(string.format('External: Snippet provider %s not found', opts.snippet.provider))
    end

    self.snippet:init(opts.snippet)
  end

  if opts.statusline and opts.statusline.provider then
    self.statusline = statusline[opts.statusline.provider]

    if not self.statusline then
      error(string.format('External: Statusline provider %s not found', opts.statusline.provider))
    end

    self.statusline:init(opts.statusline)
  end
end

function External:load_plugins()
  self.plugin:load()
  self.plugin:postload()
end

function External:configure_lsp()
  self.lsp:load()
  self.lsp:postload()
end

function External:configure_completion()
  self.completion:load()
  self.completion:postload()
end

function External:load_statusline()
  self.statusline:load()
  self.statusline:postload()
end

function External:preload()
  self.plugin:preload()
  self.snippet:preload()
  self.completion:preload()
  self.lsp:preload()
  self.statusline:preload()
end

return External
