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
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {}
    },
    'nvim-treesitter/nvim-treesitter-context',
    "laytan/cloak.nvim",
}
