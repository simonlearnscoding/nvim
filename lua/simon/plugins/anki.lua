return {
  -- "52617365/nvimanki",
  'rolf-stargate/ankifly.nvim',
  event = 'VeryLazy',
  init = function()
    vim.keymap.set('n', '<leader>a', '<cmd>Anki<cr>')
    -- vim.keymap.set('n', '<leader>ad', "<cmd>lua require('nvimanki').create_deck()<cr>", opts)
    -- vim.keymap.set('n', '<leader>au', "<cmd>lua require('nvimanki').update_decks()<cr>", opts)
    -- vim.keymap.set('x', '<leader>av', "<cmd>lua require('nvimanki').create_deck_from_visualization()<cr>", opts)
  end,
}
