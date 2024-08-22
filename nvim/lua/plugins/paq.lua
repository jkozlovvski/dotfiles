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
    { "scalameta/nvim-metals" },

    -- dependencies 
    { "nvim-lua/plenary.nvim" },
    { "nvim-tree/nvim-web-devicons" },

    -- file menager 
    { "ibhagwan/fzf-lua" },
    { "echasnovski/mini.icons", version = false },
    { "echasnovski/mini.files", version = false },
    { "otavioschwanck/arrow.nvim"}
}

