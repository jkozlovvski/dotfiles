require("nvim-treesitter.configs").setup {
    ensure_installed = {"lua", "javascript", "scala", "python", "java", "vimdoc", "luadoc", "vim", "lua", "markdown"},
    highlight = {enabled = true},
    indent = {enabled = true},
}
