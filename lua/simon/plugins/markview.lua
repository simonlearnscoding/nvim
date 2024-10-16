return {
  'OXY2DEV/markview.nvim',
  -- lazy = false, -- Recommended
  event = 'BufRead', -- Recommended
  -- ft = "markdown" -- If you decide to lazy-load anyway

  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    local presets = require 'markview.presets'
    require('markview').setup {
      checkboxes = presets.nerd,
      headings = presets.simple,
    }
  end,
}
