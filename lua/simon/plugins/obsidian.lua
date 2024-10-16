local function week_of_year(timestamp)
  local start_of_year = os.time { year = os.date('%Y', timestamp), month = 1, day = 1 }
  local week_number = math.floor((timestamp - start_of_year) / (7 * 24 * 60 * 60)) + 1
  return week_number
end

local function month_of_year(timestamp)
  return os.date('%B', timestamp)
end

local function this_week()
  local now = os.time()
  return 'week-' .. week_of_year(now)
end

local function last_week()
  local now = os.time()
  local last_week_timestamp = now - (7 * 24 * 60 * 60)
  return 'week-' .. week_of_year(last_week_timestamp)
end

local function next_week()
  local now = os.time()
  local next_week_timestamp = now + (7 * 24 * 60 * 60)
  return 'week-' .. week_of_year(next_week_timestamp)
end

local function this_month()
  local now = os.time()
  return month_of_year(now)
end

return {
  event = 'VeryLazy', -- optional, see below
  'epwalsh/obsidian.nvim',
  version = '*', -- recommended, use latest release instead of latest commit

  config = function()
    require('obsidian').setup {
      ui = {
        enable = false,
      },
      -- Other configuration options ...
      mappings = {

        ['<cr>'] = {
          action = function()
            local line = vim.fn.getline '.'

            -- Match either a Markdown-style link or an Obsidian-style link
            local markdown_start, markdown_end = string.find(line, '%[(.-)%]%((.-)%)')
            local obsidian_start, obsidian_end = string.find(line, '%[%[(.-)%]%]')

            if markdown_start then
              -- Move cursor to the first character of the Markdown-style link
              vim.fn.cursor(vim.fn.line '.', markdown_start)
              -- Run the ObsidianFollowLink command
              vim.cmd 'ObsidianFollowLink'
            elseif obsidian_start then
              -- Move cursor to the first character of the Obsidian-style link
              vim.fn.cursor(vim.fn.line '.', obsidian_start)
              -- Run the ObsidianFollowLink command
              vim.cmd 'ObsidianFollowLink'
            else
              return nil -- No link found on the line
            end
          end,
          opts = { buffer = true, expr = false },
        },
        ['<C-CR>'] = {
          action = function()
            local line = vim.fn.getline '.'
            -- Check if the current line contains a checkbox (and toggle it)
            if string.match(line, '%[ ]') then
              vim.fn.setline('.', string.gsub(line, '%[ ]', '[x]')) -- Toggle to checked
            elseif string.match(line, '%[x%]') then
              vim.fn.setline('.', string.gsub(line, '%[x%]', '[ ]')) -- Toggle to unchecked
            end
          end,
          opts = { buffer = true },
        },
      },
      templates = {
        subdir = 'templates',
        substitutions = {
          yesterday = function()
            return os.date('%Y-%m-%d', os.time() - 86400)
          end,
          two_days_ago = function()
            return os.date('%Y-%m-%d', os.time() - 180000)
          end,
          tomorrow = function()
            return os.date('%Y-%m-%d', os.time() + 86400)
          end,
          in_two_days = function()
            return os.date('%Y-%m-%d', os.time() + 18000)
          end,
          this_week = this_week,
          next_week = next_week,
          last_week = last_week,
          this_month = this_month,
        },
      },
      -- Other configurations...
      preferred_link_style = 'markdown',
      workspaces = {
        {
          name = 'personal',
          path = '~/projects/pages',
        },
      },

      -- Optional, customize how note IDs are generated given an optional title.
      ---@param title string|?
      ---@return string
      note_id_func = function(title)
        local suffix = ''
        if title ~= nil then
          suffix = title:gsub(' ', '-'):gsub('[^A-Za-z0-9-]', ''):lower()
        else
          for _ = 1, 4 do
            suffix = suffix .. string.char(math.random(65, 90))
          end
        end
        return tostring(os.time()) .. '-' .. suffix
      end,
      ---@param url string
      follow_url_func = function(url)
        -- Open the URL in the default web browser.
        vim.fn.jobstart { 'open', url } -- For Mac OS
      end,
    }
  end,
  ft = 'markdown',
  dependencies = {
    -- Required dependency.
    'nvim-lua/plenary.nvim',
  },
}
