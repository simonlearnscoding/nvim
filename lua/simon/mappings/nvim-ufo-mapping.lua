local utils = require 'simon.utils'
local wk = require("which-key")
local is_available = utils.is_available

-- Define the Folding-related mappings using which-key
if is_available('nvim-ufo') then
  -- Key mapping for 'K' with condition
  vim.keymap.set('n', 'K', function()
    local winid = require('ufo').peekFoldedLinesUnderCursor()
    if not winid then
      -- choose one of coc.nvim and nvim lsp
      vim.fn.CocActionAsync('definitionHover')   -- coc.nvim
      vim.lsp.buf.hover()
    end
  end, { noremap = true, silent = true, expr = false })

  wk.add({
    -- Folding commands
    { "zR", function() require('ufo').openAllFolds() end, desc = "Open all folds" },
    { "zM", function() require('ufo').closeAllFolds() end, desc = "Close all folds" },
    { "zn", function() require('ufo').openFoldsExceptKinds() end, desc = "Fold less" },
    { "zm", function() require('ufo').closeFoldsWith() end, desc = "Fold more" },
    { "zq", function() require('ufo').peekFoldedLinesUnderCursor() end, desc = "Peek fold" },
  })
end

