return {
    "nvim-treesitter/nvim-treesitter",

    build = ":TSUpdate",

    config = function()
        require 'nvim-treesitter.configs'.setup({
            ensure_installed = {
                "c",
                "lua",
                "vim",
                "vimdoc",
                "query",
                "javascript",
                "python",
                "go",
                "rust",
                "css",
                "gosum",
                "gomod",
                "terraform",
                "sql",
                "markdown",
                "markdown_inline",
                "html",
            },
            sync_initial = false,
            auto_install = "maintained",
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            indent = { enable = true },
        })
    end
}
