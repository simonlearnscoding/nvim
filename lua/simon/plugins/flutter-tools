return {

  'akinsho/flutter-tools.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'stevearc/dressing.nvim',
  },
  config = function()
    require('flutter-tools').setup {
      flutter_path = nil,
      flutter_lookup_cmd = 'asdf where flutter',
      fvm = false,
      widget_guides = {
        enabled = true,
      },
      lsp = {
        settings = {
          showTodos = true,
          completeFunctionCalls = true,
          analysisExcludedFolders = {
            vim.fn.expand '$HOME/.pub-cache',
          },
          renameFilesWithClasses = 'prompt',
          updateImportsOnRename = 'always',
          enablesnippets = true,
        },
      },

      debugger = {
        enabled = true,
        run_via_dap = true,
        exception_breakpoints = {},
        register_configurations = function(paths)
          local dap = require 'dap'
          dap.adapters.dart = {
            type = 'executable',
            command = paths.flutter_bin,
            args = { 'debug-adapter' },
          }
          dap.configurations.dart = {}
          require('dap.ext.vscode').load_launchjs()
        end,
      },
    }
  end,
}
