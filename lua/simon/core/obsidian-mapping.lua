local wk = require 'which-key'

local prefix = '<leader>o'

wk.add { '<leader>oo', '<cmd>ObsidianOpen<CR>', group = '󱁉 [o]bsidian..', desc = '󱁉 [o]pen vault' }
wk.add { '<leader>o', group = '󱁉 [o]bsidian..' }
wk.add { '<leader>oi', ':e ~/projects/pages/index.md <CR>', group = '󱁉 [o]bsidian..' }
wk.add { '<leader>oy', '<cmd>ObsidianDailies 0 -30 <CR>', group = '󱁉 [o]bsidian..', desc = '󰃮 [d]ailies' }
wk.add { '<leader>on', '<cmd>ObsidianNew<CR>', group = '󱁉 [o]bsidian..', desc = ' [n]ew note' }
wk.add { '<leader>oe', '<cmd>ObsidianExtractNote<CR>', group = '󱁉 [o]bsidian..', desc = ' [e]xtract note' }
wk.add { '<leader>of', '<cmd>ObsidianQuickSwitch<CR>', group = '󱁉 [o]bsidian..', desc = '󰍉 [f]ind' }
wk.add { '<leader>oT', '<cmd>ObsidianTemplate<CR>', group = '󱁉 [o]bsidian..', desc = '󱁉 [T]emplates' }
wk.add { '<leader>ot', '<cmd>ObsidianTags<CR>', group = '󱁉 [o]bsidian..', desc = '󰓹 [t]ags' }
wk.add { '<leader>og', '<cmd>ObsidianPasteImg<CR>', group = '󱁉 [o]bsidian..', desc = ' [p]aste image' }
wk.add { '<leader>or', '<cmd>ObsidianRename<CR>', group = '󱁉 [o]bsidian..', desc = '󱁉 [r]ename' }
wk.add { '<leader>ow', '<cmd>ObsidianSearch<CR>', group = '󱁉 [o]bsidian..', desc = ' [w]ord', noremap = true, silent = true }
wk.add { '<leader>ol', '<cmd>ObsidianLinks<CR>', group = '󱁉 [o]bsidian..', desc = '󱁉 [l]inks' }
wk.add { '<leader>od', '<cmd>ObsidianToday<CR>', group = '󱁉 [o]bsidian..', desc = '󰃮 to[d]ay' }
wk.add { '<leader>om', '<cmd>ObsidianTomorrow<CR>', group = '󱁉 [o]bsidian..', desc = '󰃮 to[m]orrow' }
-- Function to set keymaps specifically for Markdown files
-- TODO: wrap word with brackets function.
function WrapWordWithBrackets()
  vim.cmd 'normal! viw' -- Select the current word
  vim.cmd 'ObsidianLinkNew'
  -- Move to the end of the word and insert `]]`
end

function ObsidianAction()
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
    -- vim.cmd('normal! viw')
    -- vim.cmd('normal! I[[')
    -- vim.cmd('normal! `>a]]')
    print 'Not a link'
    WrapWordWithBrackets()
  end
end

local function handle_markdown_enter()
  -- Register Markdown-specific mappings using wk.add
  wk.add { '<BS>', '<cmd>ObsidianBacklinks<CR>', group = '󱁉 [Markdown]', desc = 'Backlinks', noremap = true, silent = true }
  wk.add { '<CR>', ':lua ObsidianAction()<CR>', group = '󱁉 [Markdown]', desc = 'Follow Link', noremap = true, silent = true }
  wk.add { '<leader><leader>', '<cmd>ObsidianLinks<CR>', group = '󱁉 [Markdown]', desc = '󱁉 Links', noremap = true, silent = true }

  -- Go to next Markdown link
  wk.add { '<Tab>', '/\\[.*\\]<CR>zz', group = '󱁉 [Markdown]', desc = 'Next Markdown Link', noremap = true, silent = true }

  -- Go to previous Markdown link
  wk.add { '<S-Tab>', '?\\[.*\\]<CR>zz', group = '󱁉 [Markdown]', desc = 'Previous Markdown Link', noremap = true, silent = true }
end

-- Set up an autocommand that calls handle_markdown_enter for Markdown files

-- Set up an autocommand that calls set_markdown_keymaps for Markdown files
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'markdown',
  callback = handle_markdown_enter,
})
