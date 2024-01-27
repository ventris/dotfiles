return {
    "kristijanhusak/vim-dadbod-ui",

    -- Dependencies
    dependencies = {
        "tpope/vim-dadbod",
        {
            "kristijanhusak/vim-dadbod-completion",
            ft = { "sql", "mysql", "plsql", "pgsql" },
        },
    },

    -- Config
    config = function()
        vim.g.db_ui_show_help = 0
        vim.g.db_ui_use_nerd_fonts = 1
        vim.g.db_ui_win_position = "right"
        vim.g.db_ui_save_location = "~/.cache/vim/db_ui_queries"
        vim.g.db_ui_auto_execute_table_helpers = 1
        vim.g.db_ui_table_helpers = {
            postgres = {
                primary_key = "id",
                foreign_key = "id",
                join_string = " = ",
                delete_cascade = "CASCADE",
                delete_restrict = "RESTRICT",
            },
        }
    end,
}
