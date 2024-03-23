return {

  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  config = function()
    require("obsidian").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      --
      workspaces = {
        {
          name = "personal",
          path = "~/projects/pages",
        },
      },

      ui = {
        enable = true, -- set to false to disable all additional syntax features

        hl_groups = {
          -- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
          ObsidianTodo = { fg = "#f78c6c" },
          ObsidianDone = { bold = true, fg = "#89ddff" },
          ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
          ObsidianTilde = { bold = true, fg = "#ff5370" },
          ObsidianBullet = { bold = true, fg = "#89ddff" },
          ObsidianRefText = { underline = true, fg = "#c792ea" },
          ObsidianExtLinkIcon = { fg = "#c792ea" },
          ObsidianTag = { italic = true, fg = "#89ddff" },
          ObsidianBlockID = { italic = true, fg = "#89ddff" },
          ObsidianHighlightText = { bg = "#75662e" },
        },
        checkboxes = {
          -- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
          [" "] = { char = "☐", hl_group = "ObsidianTodo" },
          ["x"] = { char = "", hl_group = "ObsidianDone" },
          [">"] = { char = "", hl_group = "ObsidianRightArrow" },
          ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
        }
      }
    }

    -- Key mappings should be inside the config function
    -- vim.keymap.set("n", "<leader>ob", "<cmd>ObsidianBacklinks<CR>")
    vim.keymap.set("n", "<leader>oo", "<cmd>ObsidianOpen<CR>")
    vim.keymap.set("n", "<leader>od", "<cmd>ObsidianDailies<CR>")
    vim.keymap.set("n", "<leader>on", "<cmd>ObsidianNew<CR>")
    vim.keymap.set("n", "<leader>oe", "<cmd>ObsidianExtractNote<CR>")
    vim.keymap.set("n", "<leader>of", "<cmd>ObsidianQuickSwitch<CR>")
    vim.keymap.set("n", "<leader>ot", "<cmd>ObsidianTags<CR>")
    vim.keymap.set("n", "<leader>og", "<cmd>ObsidianPasteImg<CR>")
    vim.keymap.set("n", "<leader>or", "<cmd>ObsidianRename<CR>")
    vim.keymap.set("n", "<leader>ow", "<cmd>ObsidianSearch<CR>", { noremap = true, silent = true })
    vim.keymap.set("n", "<leader>ol", "<cmd>ObsidianLinks<CR>")
    vim.keymap.set("n", "<leader>od", "<cmd>ObsidianToday<CR>")
    vim.keymap.set("n", "<leader>om", "<cmd>ObsidianTomorrow<CR>")



    -- Function to set keymaps for Markdown files
    local function set_markdown_keymaps()
      local opts = { noremap = true, silent = true }
      -- Key mappings should be inside the config function
      vim.keymap.set("n", "<CR>", "<cmd>ObsidianFollowLink<CR>", { noremap = true, silent = true })
      vim.keymap.set("n", "<BS>", "<cmd>ObsidianBacklinks<CR>", { noremap = true, silent = true })
    end

    -- Function to remove/disable keymaps for Markdown files
    local function remove_markdown_keymaps()
      local opts = { noremap = true, silent = true }
      vim.api.nvim_buf_set_keymap(0, 'n', '<CR>', '<NOP>', opts)
    end

    -- Autocommand to set Markdown keymaps when entering a Markdown file
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "markdown",
      callback = function()
        set_markdown_keymaps()
      end
    })

    -- Autocommand to remove/disable Markdown keymaps when leaving a Markdown buffer
    vim.api.nvim_create_autocmd("BufLeave", {
      pattern = "*.md",
      callback = function()
        remove_markdown_keymaps()
      end
    })
  end,
  ft = "markdown",
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    --:
    -- see below for full list of optional dependencies 👇
  },
}
