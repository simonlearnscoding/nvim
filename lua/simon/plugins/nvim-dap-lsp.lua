return {
  'theHamsta/nvim-dap-virtual-text',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'mfussenegger/nvim-dap',
  },
  config = function()
    require("nvim-dap-virtual-text").setup({
      commented = true,
    })
    vim.keymap.set("n", "<leader>dv", "<cmd>DapVirtualTextToggle<cr>", { desc = 'toggle debug virtual text' })
  end

}
