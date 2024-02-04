return {
  'microsoft/vscode-js-debug',
  -- build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
  requires = { 'mfussenegger/nvim-dap' },
  config = function()
    require('dap-vscode-js').setup({

      -- Uncomment and set the debugger_path if you have a custom installation path for vscode-js-debug
      debugger_path = "/home/simon/.config/vscode-js-debug",
      adapters = { 'chrome', 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost', 'node', 'chrome' }

    })

    local js_based_languages = { "typescript", "javascript", "typescriptreact" }

    for _, language in ipairs(js_based_languages) do
      require("dap").configurations[language] = {
        {
          type = "pwa-node",
          request = "launch",
          name = "Launch file",
          program = '${workspaceFolder}/node_modules/next/dist/bin/next',
          command = "npm run dev",
          cwd = "${workspaceFolder}",
        },
        {
          type = "pwa-node",
          request = "attach",
          name = "Attach",
          processId = require 'dap.utils'.pick_process,
          cwd = "${workspaceFolder}",
        },
        {
          type = "pwa-chrome",
          request = "launch",
          name = "Start Chrome with \"localhost\"",
          url = "http://localhost:3000",
          webRoot = "${workspaceFolder}",
          userDataDir = "${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir"
        }
      }
    end
  end
}
