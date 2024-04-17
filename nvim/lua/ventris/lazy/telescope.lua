return {
    "nvim-telescope/telescope-file-browser.nvim",

    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
        "ElPiloto/telescope-vimwiki.nvim"
    },

    config = function()
        require('telescope').setup({})

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        vim.keymap.set('n', '<leader>pws', function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end)
        vim.keymap.set('n', '<leader>pWs', function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end)
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)
        vim.keymap.set('n', '<leader>pb', builtin.buffers, {})
        vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})

        vim.keymap.set("n", "<leader>pd", ":Telescope file_browser<CR>")

        vim.keymap.set("n", "<leader>wg", ":Telescope vimwiki live_grep<CR>")

        vim.keymap.set("n", "<leader>gSc", function()
            builtin.git_commits({})
        end)
    end
}
