local refactoring_keybinds = {
    {
        key = '<leader>le',
        command = '<Cmd>lua require("refactoring").refactor("Extract Function")<CR>',
        description = 'Extract Function'
    },
    {
        key = '<leader>lv',
        command = '<Cmd>lua require("refactoring").refactor("Extract Variable")<CR>',
        description = 'Extract Variable'
    },
    {
        key = '<leader>li',
        command = '<Cmd>lua require("refactoring").refactor("Inline Variable")<CR>',
        description = 'Inline Variable'
    },


    {
        key = '<leader>lf',
        command = '<Cmd>lua require("refactoring").refactor("Extract File")<CR>',
        description = 'Extract to File'
    },
}

return {
    'ThePrimeagen/refactoring.nvim',
    requires = { -- Changed 'dependencies' to 'requires' as it's the correct keyword
        'nvim-lua/plenary.nvim',
        'nvim-treesitter/nvim-treesitter',
    },
    event = 'VeryLazy',
    config = function()
        require('refactoring').setup {}
        for _, keybind in ipairs(refactoring_keybinds) do
            vim.keymap.set({ 'n', 'v' }, keybind.key, keybind.command,
                { silent = true, noremap = true, desc = keybind.description })
        end
    end,
}
