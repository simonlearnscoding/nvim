local wk = require 'which-key'

local prefix = '<leader>o'

-- Register the Obsidian mappings under the <leader>o prefix
wk.add({
  { prefix, group = '󱁉 [o]bsidian..' },

  -- Individual Obsidian commands
  { prefix .. 'o', '<cmd>ObsidianOpen<CR>', desc = '󱁉 [o]pen vault' },
  { prefix .. 'i', ':e ~/projects/pages/index.md <CR>', desc = ' [i]ndex note' },
  { prefix .. 'y', '<cmd>ObsidianDailies<CR>', desc = '󰃮 [d]ailies' },
  { prefix .. 'n', '<cmd>ObsidianNew<CR>', desc = ' [n]ew note' },
  { prefix .. 'e', '<cmd>ObsidianExtractNote<CR>', desc = ' [e]xtract note' },
  { prefix .. 'f', '<cmd>ObsidianQuickSwitch<CR>', desc = '󰍉 [f]ind' },
  { prefix .. 'T', '<cmd>ObsidianTemplate<CR>', desc = '󱁉 [T]emplates' },
  { prefix .. 't', '<cmd>ObsidianTags<CR>', desc = '󰓹 [t]ags' },
  { prefix .. 'g', '<cmd>ObsidianPasteImg<CR>', desc = ' [p]aste image' },
  { prefix .. 'r', '<cmd>ObsidianRename<CR>', desc = '󱁉 [r]ename' },
  { prefix .. 'w', '<cmd>ObsidianSearch<CR>', desc = ' [w]ord', noremap = true, silent = true },
  { prefix .. 'l', '<cmd>ObsidianLinks<CR>', desc = '󱁉 [l]inks' },
  { prefix .. 'd', '<cmd>ObsidianToday<CR>', desc = '󰃮 to[d]ay' },
  { prefix .. 'm', '<cmd>ObsidianTomorrow<CR>', desc = '󰃮 to[m]orrow' },
})

-- Function to set keymaps specifically for Markdown files
local function WrapWordWithBrackets()
  vim.cmd 'normal! viw' -- Select the current word
  vim.cmd 'ObsidianLinkNew'
  -- Move to the end of the word and insert `]]`
end

local function ObsidianAction()
  local line = vim.api.nvim_get_current_line()
  local col = vim.api.nvim_win_get_cursor(0)[2] + 1 -- Lua is 1-indexed
  -- Use a pattern to capture the word under the cursor
  -- This pattern looks for [[, any characters, and ]]
  local pattern = '%[(.-)%]'
  local word_start, word_end, captured = string.find(line, pattern, 1)

  -- Check if the cursor is within the bounds of a word that matches the pattern
  if word_start and word_end and col >= word_start and col <= word_end then
    -- The cursor is on a word that starts with [[ and ends with ]]
    -- Replace this with the actual function or command to follow the link
    print 'Following link'
    vim.cmd 'ObsidianFollowLink'
  else
    -- Not on a link, wrap the current word with [[ ]]
    print 'Not a link'
    WrapWordWithBrackets()
  end
end

local function handle_markdown_enter()

  local markdownMappings = {
    { '<BS>', '<cmd>ObsidianBacklinks<CR>', desc = 'Backlinks', noremap = true, silent = true },
    { '<CR>', ':lua ObsidianAction()<CR>', desc = 'Follow Link', noremap = true, silent = true },
    { '<leader><leader>', '<cmd>ObsidianLinks<CR>', desc = '󱁉 links', noremap = true, silent = true },
  }

  -- Register Markdown-specific mappings
wk.add(markdownMappings, { mode = 'n', buffer = vim.api.nvim_get_current_buf() })

  -- Go to next Markdown link
  vim.api.nvim_set_keymap('n', '<Tab>', '/\\[.*\\]<CR>zz', { noremap = true, silent = true })
  -- Go to previous Markdown link
  vim.api.nvim_set_keymap('n', '<S-Tab>', '?\\[.*\\]<CR>zz', { noremap = true, silent = true })
end

-- Set up an autocommand that calls handle_markdown_enter for Markdown files
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'markdown',
  callback = handle_markdown_enter,
})

