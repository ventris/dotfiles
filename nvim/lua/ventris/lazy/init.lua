return {
	"folke/tokyonight.nvim",
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			vim.cmd("colorscheme rose-pine")
		end,
	},
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
