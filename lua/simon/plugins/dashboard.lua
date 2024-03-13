-- return {
--     'goolord/alpha-nvim',
--     event = 'BufWinEnter',
--     dependencies = {
--         'nvim-tree/nvim-web-devicons',
--         'nvim-lua/plenary.nvim'
--     },
--     config = function()
--         require 'alpha'.setup(require 'alpha.themes.theta'.config)
--     end
--
-- };

return {
    'nvimdev/dashboard-nvim',
    event = 'BufWinEnter',
    config = function()
        require('dashboard').setup {
            -- config
            theme = 'hyper',
            config = {
                week_header = {
                    enable = true,
                },
                shortcut = {
                    {
                        icon_hl = '@variable',
                        desc = '󱑇 Files',
                        group = 'Label',
                        action = 'Telescope find_files',
                        key = 'f',
                    },
                    {
                        desc = ' Todo',
                        group = 'DiagnosticHint',
                        action = 'TodoTelescope',
                        key = 't',
                    },
                    {
                        desc = 'Session',
                        group = 'Number',
                        action = 'Sessionmanager load_session',
                        key = 's',
                    },

                    {
                        desc = 'Bibtex',
                        group = 'Number',
                        action = 'Telescope bibtex',
                        key = 's',
                    },
                },
            },

        }
    end,

    dependencies = { { 'nvim-tree/nvim-web-devicons' } }
}


-- ALPHA
-- return {
--     'goolord/alpha-nvim',
--     dependencies = {
--         'nvim-tree/nvim-web-devicons',
--         'nvim-lua/plenary.nvim'
--     },
--     config = function()
--         require 'alpha'.setup(require 'alpha.themes.theta'.config)
--     end
-- };
