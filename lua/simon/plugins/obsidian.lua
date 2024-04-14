return {

  event = 'BufEnter', -- optional, see below
  'epwalsh/obsidian.nvim',
  version = '*', -- recommended, use latest release instead of latest commit
  config = function()
    require('obsidian').setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      --
      -- Either 'wiki' or 'markdown'.
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
        -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
        -- In this case a note with the title 'My new note' will be given an ID that looks
        -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
        local suffix = ''
        if title ~= nil then
          -- If title is given, transform it into valid file name.
          suffix = title:gsub(' ', '-'):gsub('[^A-Za-z0-9-]', ''):lower()
        else
          -- If title is nil, just add 4 random uppercase letters to the suffix.
          for _ = 1, 4 do
            suffix = suffix .. string.char(math.random(65, 90))
          end
        end
        return tostring(os.time()) .. '-' .. suffix
      end,
      ---@param url string
      follow_url_func = function(url)
        -- Open the URL in the default web browser.
        vim.fn.jobstart { 'open', url } -- Mac OS
        -- vim.fn.jobstart({"xdg-open", url})  -- linux
      end,
      -- ui = {
      --   enable = true, -- set to false to disable all additional syntax features
      --
      --   hl_groups = {
      --     -- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
      --     ObsidianTodo = { fg = "#f78c6c" },
      --     ObsidianDone = { bold = true, fg = "#89ddff" },
      --     ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
      --     ObsidianTilde = { bold = true, fg = "#ff5370" },
      --     ObsidianBullet = { bold = true, fg = "#89ddff" },
      --     ObsidianRefText = { underline = true, fg = "#c792ea" },
      --     ObsidianExtLinkIcon = { fg = "#c792ea" },
      --     ObsidianTag = { italic = true, fg = "#89ddff" },
      --     ObsidianBlockID = { italic = true, fg = "#89ddff" },
      --     ObsidianHighlightText = { bg = "#75662e" },
      --   },
      --   -- checkboxes = {
      --   --   -- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
      --   --   [" "] = { char = "☐", hl_group = "ObsidianTodo" },
      --   --   ["x"] = { char = "", hl_group = "ObsidianDone" },
      --   --   [">"] = { char = "", hl_group = "ObsidianRightArrow" },
      --   --   ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
      --   -- }
      -- }
    }

    -- Key mappings should be inside the config function
    -- vim.keymap.set("n", "<leader>ob", "<cmd>ObsidianBacklinks<CR>")
    -- local utils = require 'simon.utils'
    -- local maps = { i = {}, n = {}, v = {}, t = {} }
    --
    -- local prefix = '<leader>o'

    -- vim.keymap.set("n", "<leader>oo", "<cmd>ObsidianOpen<CR>")
    -- vim.keymap.set("n", "<leader>oi", ":e ~/projects/pages/index.md<CR>")
    -- vim.keymap.set("n", "<leader>oy", "<cmd>ObsidianDailies<CR>")
    -- vim.keymap.set("n", "<leader>on", "<cmd>ObsidianNew<CR>")
    -- vim.keymap.set("n", "<leader>oe", "<cmd>ObsidianExtractNote<CR>")
    -- vim.keymap.set("n", "<leader>of", "<cmd>ObsidianQuickSwitch<CR>")
    -- vim.keymap.set("n", "<leader>ot", "<cmd>ObsidianTags<CR>")
    -- vim.keymap.set("n", "<leader>og", "<cmd>ObsidianPasteImg<CR>")
    -- vim.keymap.set("n", "<leader>or", "<cmd>ObsidianRename<CR>")
    -- vim.keymap.set("n", "<leader>ow", "<cmd>ObsidianSearch<CR>", { noremap = true, silent = true })
    -- vim.keymap.set("n", "<leader>ol", "<cmd>ObsidianLinks<CR>")
    -- -- vim.keymap.set("n", "<leader><leader>", "<cmd>ObsidianLinks<CR>")
    -- vim.keymap.set("n", "<leader>od", "<cmd>ObsidianToday<CR>")
    -- vim.keymap.set("n", "<leader>om", "<cmd>ObsidianTomorrow<CR>")
    -- vim.keymap.set("n", "<CR>", "<cmd>ObsidianFollowLink<CR>", { noremap = true, silent = true })
    -- vim.keymap.set("n", "<BS>", "<cmd>ObsidianBacklinks<CR>", { noremap = true, silent = true })

    -- local function set_markdown_keymaps()
    --   local opts = { noremap = true, silent = true }
    --   vim.keymap.set("n", "<BS>", "<cmd>ObsidianBacklinks<CR>", { noremap = true, silent = true })
    -- end

    -- local function remove_markdown_keymaps()
    --   local opts = { noremap = true, silent = true }
    -- end
  end,
  ft = 'markdown',
  dependencies = {
    -- Required.
    'nvim-lua/plenary.nvim',

    --:
    -- see below for full list of optional dependencies 👇
  },
}
