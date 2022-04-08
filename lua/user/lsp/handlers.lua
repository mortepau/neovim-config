local handlers = {}

local default = {
  ['declaration']             = vim.lsp.buf['declaration'],
  ['completion']              = vim.lsp.buf['completion'],
  ['references']              = vim.lsp.buf['references'],
  ['implementation']          = vim.lsp.buf['implementation'],
  ['formatting']              = vim.lsp.buf['formatting'],
  ['formatting_sync']         = vim.lsp.buf['formatting_sync'],
  ['type_definition']         = vim.lsp.buf['type_definition'],
  ['formatting_seq_sync']     = vim.lsp.buf['formatting_seq_sync'],
  ['hover']                   = vim.lsp.buf['hover'],
  ['range_formatting']        = vim.lsp.buf['range_formatting'],
  ['signature_help']          = vim.lsp.buf['signature_help'],
  ['execute_command']         = vim.lsp.buf['execute_command'],
  ['incoming_calls']          = vim.lsp.buf['incoming_calls'],
  ['outgoing_calls']          = vim.lsp.buf['outgoing_calls'],
  ['list_workspace_folders']  = vim.lsp.buf['list_workspace_folders'],
  ['document_symbol']         = vim.lsp.buf['document_symbol'],
  ['workspace_symbol']        = vim.lsp.buf['workspace_symbol'],
  ['add_workspace_folder']    = vim.lsp.buf['add_workspace_folder'],
  ['range_code_action']       = vim.lsp.buf['range_code_action'],
  ['code_action']             = vim.lsp.buf['code_action'],
  ['clear_references']        = vim.lsp.buf['clear_references'],
  ['server_ready']            = vim.lsp.buf['server_ready'],
  ['document_highlight']      = vim.lsp.buf['document_highlight'],
  ['definition']              = vim.lsp.buf['definition'],
  ['remove_workspace_folder'] = vim.lsp.buf['remove_workspace_folder'],
  ['rename']                  = vim.lsp.buf['rename'],
}

local function get_default(handler)
  return default[handler]
end

handlers['textDocument/rename'] = function()
  local lsp_params = vim.lsp.util.make_position_params()
  local buf = vim.api.nvim_create_buf(false, true)
  local win_params = {
  }
  local win = vim.api.nvim_open_win(buf, true, win_params)
end

return handlers
