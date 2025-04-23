return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    lazy = true,
    config = false,
    init = function()
      -- Disable automatic setup, we are doing it manually
      -- vim.g.lsp_zero_extend_cmp = 0
      -- vim.g.lsp_zero_extend_lspconfig = 0
    end,
  },
  {
    'neovim/nvim-lspconfig',
    cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
    event = { 'BufReadPost', 'BufNewFile' },
    dependencies = {
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
    },
    config = function()
      local lsp = require 'lsp-zero'
      lsp.extend_lspconfig()
      lsp.set_sign_icons { error = ' ', warn = ' ', hint = '', info = '' }

      -- Ensure no node modules are in the list
      local function filter(arr, fn)
        if type(arr) ~= 'table' then
          return arr
        end

        local filtered = {}
        for k, v in pairs(arr) do
          if fn(v, k, arr) then
            table.insert(filtered, v)
          end
        end

        return filtered
      end

      local function filterReactDTS(value)
        return string.match(value.filename, 'react/index.d.ts') == nil
      end

      local function on_list(options)
        local items = options.items
        if #items > 1 then
          items = filter(items, filterReactDTS)
        end

        vim.fn.setqflist({}, ' ', { title = options.title, items = items, context = options.context })
        vim.api.nvim_command 'cfirst' -- or maybe you want 'copen' instead of 'cfirst'
      end
      lsp.on_attach(function(client, bufnr)
        local opts = { buffer = bufnr, remap = false }

        vim.keymap.set('n', 'gd', function()
          vim.lsp.buf.definition { on_list = on_list }
        end, opts)
        vim.keymap.set('n', 'K', function()
          vim.lsp.buf.hover()
        end, opts) -- this one works pretty good
        vim.keymap.set('n', '<leader>F', function()
          vim.lsp.buf.format()
        end, { desc = 'format file' }) -- this one works pretty good

        vim.keymap.set('n', '<leader>fr', function()
          require('telescope.builtin').lsp_references()
        end, opts)

        local function goto_definition_split()
          -- Split the window horizontally and then jump to the definition
          vim.cmd 'vsplit'
          vim.lsp.buf.definition()
        end
        vim.keymap.set('n', 'gs', goto_definition_split, { silent = true })
      end)

      require('mason').setup {
        -- ensure_installed = { 'debugpy' },
      } --TODO: I wasnt able to add debugpy to the ensure installed list

      -- ──────────────────────────────────────────────────────────────────────
      require('mason-lspconfig').setup {
        -- ensure_installed = { 'lua_ls', 'graphql', 'emmet_ls', 'texlab', 'tsserver' }, --  'pylyzer' 'eslint' 'emmet_ls'  'tsserver'
        handlers = {
          lsp.default_setup,
        },
      }

      -- TODO: pretty sure this won't work
      require('lspconfig').dartls.setup {
        cmd = { '/home/simon/flutter/bin/dart', 'language-server', '--protocol=lsp' },
        filetypes = { 'dart' },
        init_options = {
          onlyAnalyzeProjectsWithOpenFiles = true,
          suggestFromUnimportedLibraries = true,
        },
        root_dir = require('lspconfig').util.root_pattern 'pubspec.yaml',
      }
      local util = require 'lspconfig/util'
      require('lspconfig').ts_ls.setup {
        on_attach = on_attach,
        filetypes = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
        root_dir = function(fname)
          if util.root_pattern('deno.json', 'deno.jsonc')(fname) then
            print 'Found Deno config; skipping ts_ls.'
            return nil
          end
          local pkg = util.root_pattern 'package.json'(fname)
          print('Detected Node project root:', pkg)
          return pkg
        end,
        single_file_support = false,
      }
      require('lspconfig').denols.setup {
        filetypes = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
        root_dir = require('lspconfig').util.root_pattern 'deno.json',
      }

      -- Java LSP setup
      require('lspconfig').jdtls.setup {
        cmd = { 'jdtls' },
        root_dir = require('lspconfig.util').root_pattern('.git', 'mvnw', 'gradlew'),
        settings = {
          java = {
            format = {
              enabled = true,
            },
          },
        },
      }

      require('lspconfig').pylsp.setup {
        settings = {

          pylsp = {
            -- root_dir = function()
            -- 	root_pattern('pyproject.toml', 'requirements.txt', '.git')
            -- end,
            plugins = {

              -- formatter options
              black = { enabled = true },
              -- autopep8 = { enabled = false },
              -- yapf = { enabled = false },
              -- -- linter options
              -- -- pylint = { enabled = true, executable = "pylint" },
              pyflakes = { enabled = false },
              pycodestyle = {
                enabled = true,
                ignore = { 'E501' }, -- Option 1: Ignore E501
                maxLineLength = 120, -- Option 2: Set a longer maximum line length
              },
              -- -- type checker
              -- pylsp_mypy = { enabled = true },
              -- -- auto-completion options
              jedi_completion = { fuzzy = true },
              -- -- import sorting
              pyls_isort = { enabled = true },
            },
          },
        },
      }

      -- require('lspconfig').mypy.setup({
      -- 	filetypes = { 'python' },
      -- })
      -- require('lspconfig').ts_ls.setup {}
      require('lspconfig').alejandra.setup {}
      --
      require('lspconfig').tailwindcss.setup {
        -- root_dir = {}
      }

      require('lspconfig').lua_ls.setup {
        -- root_dir = {}
      }
      -- require('lspconfig').eslint.setup {
      --   -- root_dir = {}
      -- }

      -- require('lspconfig').pylyzer.setup({
      -- 	-- root_dir = function() vim.fn.getcwd() end,
      -- 	settings = {
      -- 		pylyzer = {
      -- 			single_file_mode = false
      -- 		}
      -- 	}
      -- 	filetypes = { 'python' },
      -- })
      --
      require('lspconfig').pyright.setup {
        pythonPath = '~/code/discord/habit_tracker/venv/bin/python',
      }
      -- require('lspconfig').nil_ls.setup {}

      require('lspconfig').nixd.setup {

        cmd = { 'nixd' },
        settings = {
          nixd = {
            nixpkgs = {
              expr = 'import <nixpkgs> { }',
            },
            formatting = {
              command = { 'alejandra' },
            },
            options = {
              nixos = {
                expr = '(builtins.getFlake "github:simonlearnscoding/nixos-dotfiles").nixosConfiguration.pc.options',
              },
              home_manager = {

                expr = '(builtins.getFlake "github:simonlearnscoding/nixos-dotfiles").homeConfiguration.simon.options',
              },
            },
          },
        },
      }

      require('lspconfig').texlab.setup {

        -- filetypes = {}
      }

      -- require('lspconfig').emmet_ls.setup({
      --
      -- })
    end,
  },
}
