return 
{
  {
    'folke/zen-mode.nvim',
    opts = {
      window = {
        width = 0.85, -- width will be 85% of the editor width
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        options = {
          signcolumn = 'no',      -- disable signcolumn
          number = false,         -- disable number column
          relativenumber = false, -- disable relative numbers
          cursorline = false,     -- disable cursorline
          cursorcolumn = false,   -- disable cursor column
          foldcolumn = '0',       -- disable fold column
          list = false,           -- disable whitespace characters
        },
      },
    },
  },


  

  -- Lua
  {
    'folke/twilight.nvim',
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      dimming = {
        alpha = 0.45,    -- amount of dimming
      },
      context = 15,      -- amount of lines we will try to show around the current line
      treesitter = true, -- use treesitter when available for the filetype
    },
  }
  
  }
