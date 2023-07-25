require'nvim-treesitter.configs'.setup {
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

  sync_install = false,

  auto_install = true,

  highlight = {
    enable = true,

    additional_vim_regex_highlighting = false,
  },
}
