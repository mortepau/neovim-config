-- Print the startup time if the '--startuptime' flag is provided
local function startuptime()
  local argv = vim.v.argv
  local startupfile
  for i, arg in ipairs(argv) do
    if arg:match('--startuptime') then
      startupfile = argv[i+1]
      break
    end
  end

  if startupfile then
    local file_handle = io.open(startupfile, 'r')
    file_handle:seek('end', -50)
    local lines = vim.split(file_handle:read('*all'), '\n')
    local line = lines[#lines -1]
    if line:match('NVIM STARTED %-%-%-$') then
      local time = line:match('^(%d+%.%d+)')
      local expanded_startupfile = vim.fn.fnamemodify(startupfile, ':p')
      vim.notify(string.format('Started up in %.3fms (%s)', time, expanded_startupfile))
      vim.cmd('command! -nargs=0 Startup edit ' .. expanded_startupfile)
    end
  end
end
-- Only check the startup time when more than two arguments are provided
if #vim.v.argv > 2 then
  vim.defer_fn(startuptime, 500)
end

