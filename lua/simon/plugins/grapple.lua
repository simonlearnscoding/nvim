return {
  'cbochs/grapple.nvim',
  config = function()
    vim.keymap.set("n", "<leader><leader>", require("grapple").toggle)
    vim.keymap.set("n", "<leader>p", require("portal.builtin").grapple.tunnel)
  end

}
