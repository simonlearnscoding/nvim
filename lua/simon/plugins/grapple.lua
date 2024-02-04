return {
  'cbochs/grapple.nvim',
  config = function()
    vim.keymap.set("n", "<leader><leader>", "<cmd>GrappleTag<cr>")
    vim.keymap.set("n", "<leader>p", "<cmd>GrapplePopup tags<cr>")
  end

}
