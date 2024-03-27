function ColorMyPencils(color)
    color = color or "poimandres"
    vim.cmd.colorscheme(color)

    --- vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
    --- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#3e8fb0" })
end

return {
    {
        'olivercederborg/poimandres.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            require('poimandres').setup {
                disable_background = true,
                -- leave this setup function empty for default config
                -- or refer to the configuration section
                -- for configuration options
            }
            ColorMyPencils()
        end,
    }
}
