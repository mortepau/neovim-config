local function autocmd(augroups)
  for name, definitions in pairs(augroups) do
    if #definitions > 0 then
      vim.api.nvim_command('augroup ' .. name)
      vim.api.nvim_command('autocmd!')
      for _, definition in ipairs(definitions) do
        local s = 'autocmd '

        if definition.group then
          s = s .. ' ' .. definition.group
        end

        if not definition.event then
          error(string.format('Autocmd: No event %s', definition.event))
        end

        if type(definition.event) == 'table' then
          local first = true
          for _, event in pairs(definition.event) do
            if first then
              s = s .. ' ' .. event
              first = false
            else
              s = s .. ',' .. event
            end
          end
        else
          s = s .. ' ' .. definition.event
        end

        if not definition.pat and not definition.buffer then
          error('Autocmd: Either pattern or buffer is required')
        end

        if definition.pat and definition.buffer then
          error('Autocmd: Cannot have both pattern and buffer')
        end

        if definition.pat then
          if type(definition.pat) == 'table' then
            local first = true
            for _, pat in pairs(definition.pat) do
              if first then
                s = s .. ' ' .. pat
                first = false
              else
                s = s .. ',' .. pat
              end
            end
          else
            s = s .. ' ' .. definition.pat
          end
        elseif definition.buffer then
          if definition.buffer == 0 then
            s = s .. ' <buffer>'
          else
            s = s .. ' <buffer=' .. definition.buffer .. '>'
          end
        end

        if definition.once then
          s = s .. ' ++once'
        end

        if definition.nested then
          s = s .. ' ++nested'
        end

        if not definition.cmd then
          error('Autocmd: A command to execute is required')
        end

        s = s .. ' ' .. definition.cmd

        vim.api.nvim_command(s)
      end
      vim.api.nvim_command('augroup END')
    end
  end
end

return autocmd
