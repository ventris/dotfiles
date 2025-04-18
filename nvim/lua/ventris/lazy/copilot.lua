return {
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                suggestion = {
                    enabled = true,
                    auto_trigger = false,
                    hide_during_completion = false,
                    debounce = 25,
                    keymap = {
                        accept = "<leader><Tab>",
                        accept_word = false,
                        accept_line = "<Tab>",
                        next = "<leader>Q",
                        prev = false,
                        dismiss = false,
                    },
                },
            })
        end,
    },
}
