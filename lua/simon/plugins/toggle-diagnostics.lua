return {
  'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim',
  {
    'dgagn/diagflow.nvim',
    event = 'LspAttach', -- This is what I use personnally and it works great
    config = function()
      require('diagflow').setup({

        placement = 'inline',
        inline_padding_left = 3,
        show_sign = true,

      })
      require('toggle_lsp_diagnostics').init()
      vim.cmd('DiagflowToggle')
      function ToggleDiagnosticPlugins()
        vim.api.nvim_exec('ToggleDiag', true)
        vim.api.nvim_exec('DiagflowToggle', true)
      end

      vim.keymap.set("n", "<leader>dt", ":lua ToggleDiagnosticPlugins()<CR>")
    end
  }
}
