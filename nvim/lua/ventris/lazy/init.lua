return {
    {
        "nvim-lua/plenary.nvim",
        name = "plenary"
    },
    {
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup {
                icons = false,
            }
        end
    },
    'nvim-treesitter/nvim-treesitter-context',
    "github/copilot.vim",
    "laytan/cloak.nvim",
}
