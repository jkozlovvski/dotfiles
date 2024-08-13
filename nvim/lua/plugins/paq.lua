require "paq" {
    -- paq managing itself
    "savq/paq-nvim", 

    -- tree-sitter
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },

    -- { 'savq/melange-nvim', build = vim.cmd.colorscheme("melange")},
    { "catppuccin/nvim", name = "catppuccin", build = vim.cmd.colorscheme("catppuccin-latte") },

    -- LSP
    { 'echasnovski/mini.completion' },
    { 'neovim/nvim-lspconfig' },

    -- plenary 
    { "nvim-lua/plenary.nvim" },

    -- metals
    -- TODO: FIX
    { "scalameta/nvim-metals" },
}

