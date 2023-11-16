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
		event = { 'BufReadPre', 'BufNewFile' },
		dependencies = {
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'williamboman/mason.nvim' },
			{ 'williamboman/mason-lspconfig.nvim' },
		},
		config = function()
			local lsp = require("lsp-zero")
			lsp.extend_lspconfig()
			lsp.set_sign_icons({ error = ' ', warn = ' ', hint = '', info = '' })


			lsp.on_attach(function(client, bufnr)
				local opts = { buffer = bufnr, remap = false }

				vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)      -- this one works pretty good
				vim.keymap.set("n", "<leader>F", function() vim.lsp.buf.format() end, opts) -- this one works pretty good
				vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
				vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)

				vim.keymap.set("n", "gr", function() require('telescope.builtin').lsp_references() end, opts)
				vim.keymap.set("n", "fr", function() require('telescope.builtin').lsp_references() end, opts)
				vim.keymap.set("n", "<leader>gr", function() require('telescope.builtin').lsp_references() end, opts)
				vim.keymap.set("n", "<leader>lwl", ":LspZeroWorkspaceList<CR>", opts)
				vim.keymap.set("n", "<leader>lwr", ":LspZeroWorkspaceRemove<CR>", opts)
				vim.keymap.set("n", "<leader>lwa", ":LspZeroWorkspaceAdd<CR>", opts)
				vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
				-- vim.keymap.set("n", "<leader>df", function() vim.diagnostic.open_float() end)
			end)

			local diagnostics_visible = true
			function ToggleDiagnostics()
				diagnostics_visible = not diagnostics_visible
				vim.diagnostic.config({
					virtual_text = diagnostics_visible,
				})
			end

			vim.keymap.set("n", "<leader>td", "lua ToggleDiagnostics()<CR>")
			lsp.format_on_save({
				servers = {
					['lua_ls'] = { 'lua' },
					['typescript-tools'] = { 'typescriptreact' }
				}
			})
			require('mason').setup()
			require("mason-lspconfig").setup({
				ensure_installed = { 'lua_ls', 'tailwindcss', 'eslint', 'texlab' }, --  'eslint' 'emmet_ls'  'tsserver'
				handlers = {
					lsp.default_setup
				}

			})
			-- require('lspconfig').ls_emmet.setup({
			-- 	filetypes = { 'typescriptreact' }
			-- })
			-- require('lspconfig').tsserver.setup({
			-- 	update_insert_text = false
			-- filetypes = { 'lua', 'python' }
			-- })
			require('lspconfig').tailwindcss.setup({
				-- root_dir = {}
			})

			require('lspconfig').texlab.setup({

				-- filetypes = {}

			})

			-- require('lspconfig').emmet_ls.setup({
			--
			-- })
		end,
	}
}
