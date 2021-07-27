require('luasnip').config.set_config({
  history = true,
  updateevents = 'TextChanged,TextChangedI'
})

local ls = require('luasnip')
local s, sn, t, i, f, c, d = ls.snippet, ls.snippet_node, ls.text_node,
  ls.insert_node, ls.function_node, ls.choice_node, ls.dynamic_node
local lambda = require('luasnip.extras').lambda
local rep = require('luasnip.util.functions').rep
local partial = require('luasnip.util.functions').partial

local function get_commentstring()
  local commentstring = vim.opt.commentstring:get()
  local placeholder_pos = commentstring:find('%%s')
  if not placeholder_pos then
    return commentstring
  end
  commentstring = commentstring:sub(1, placeholder_pos-1)
  if commentstring:sub(#commentstring) ~= ' ' then
    return commentstring .. ' '
  end
  return commentstring
end

local user = mortepau.user

local function comment_string(prefix, text)
  return s(prefix, {
    f(get_commentstring, {}),
    c(1, {
      -- TODO:
      t(string.format('%s: ', text)),
      -- TODO(user):
      t(string.format('%s(%s): ', text, user)),
      -- TODO(JIRA-1234):
      sn(2, {
        t(string.format('%s(', text)),
        i(1, 'JIRA-1234'),
        t('): ')
      }),
      -- TODO(user, JIRA-1234):
      sn(2, {
        t(string.format('%s(%s, ', text, user)),
        i(1, 'JIRA-1234'),
        t('): ')
      }),
    }),
    i(0)
  })
end

-- TODO(mortepau): Store the previous value if changed and reuse it
local function luadoc(args, old_state)
  local nodes = {}
  old_state = old_state or {}

  local func_args = vim.split(args[1][1], ', ?')
  if #func_args > 0 then
    table.insert(nodes, t({ '---A short description', '' }))
  end
  for _, arg in ipairs(func_args) do
    if #arg > 0 then
      local doctext = t({ '---@param ' .. arg .. ' any @comment', '' })
      table.insert(nodes, doctext)
    end
  end

  local snip = sn(nil, nodes)
  snip.old_state = old_state
  return snip
end

ls.snippets = {
  all = {
    -- Special comment strings
    comment_string('todo', 'TODO'),
    comment_string('fix', 'FIXME'),
    comment_string('note', 'NOTE'),
    comment_string('xxx', 'XXX'),
    comment_string('opt', 'OPTIMIZE'),
    comment_string('hack', 'HACK'),
    s('date', {
      c(1, {
        f(function() return os.date('%d-%m-%Y') end, {}),
        f(function() return os.date('%d-%m-%y') end, {}),
        f(function() return os.date('%d/%m/%y') end, {}),
        f(function() return os.date('%d.%m.%y') end, {}),
        f(function() return os.date('%d. %B %Y') end, {}),
        f(function() return os.date('%d. %b. %Y') end, {}),
      })
    }),
    s('time', {
      c(1, {
        f(function() return os.date('%H:%M:%S') end, {}),
        f(function() return os.date('%H.%M.%S') end, {}),
      })
    })
  },
  lua = {
    s('func', {
      d(1, luadoc, { 3 }),
      f(function(args)
        local value = args[1][1]
        if value:find('%.') then
          return ''
        else
          return 'local '
        end
      end, {2}),
      t('function '),
      c(2, {
        sn(nil, { i(1, 'name') }),
        sn(nil, {
          t('M.'),
          i(1, 'name'),
        }),
        sn(nil, {
          f(function(args) return args[1].env.TM_FILENAME_BASE .. '.' end, {}),
          i(1, 'name'),
        }),
      }),
      t('('),
      i(3),
      t({')', '\t'}),
      i(0),
      t({ '', 'end' })
    }),
  }
}
