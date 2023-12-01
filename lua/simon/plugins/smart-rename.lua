return {
  {

    'stevearc/dressing.nvim',

    config = function()
      require("dressing").setup {
        input = {
          override = function(conf)
            conf.col = -1
            conf.row = 0
            return conf
          end,
        },
      }
    end
  },
  {
    'smjonas/inc-rename.nvim',
    config = function()
      vim.keymap.set("n", "<leader>r", ":IncRename ")
      require('inc_rename').setup({
        input_buffer_type = "dressing",
      })
    end,
  }

}
