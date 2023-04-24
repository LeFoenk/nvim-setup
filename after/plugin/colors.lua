require("catppuccin").setup({
    integrations = {
        indent_blankline = {
            enabled = true,
            colored_indent_levels = true,
        },
    },
    cmp = true, --YES
    gitsigns = true, --YES
    harpoon = true, --YES
    lualine = true, --YES
    markdown = true, --TODO
    mason = true, --YES
    noice = true, --YES
    notify = true, --YES
    nvimtree = true,
    telescope = true, --YES
    treesitter = true, -- YES
    treesitter_context = true, --MAYBE?
    ts_rainbow2 = true, --YES
    which_key = false,
})


function ColorMyPencils(color)
    color = color or "catppuccin"
    vim.cmd.colorscheme(color)
end

ColorMyPencils()
