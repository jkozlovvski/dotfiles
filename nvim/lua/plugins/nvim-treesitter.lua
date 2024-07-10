return {
  'nvim-treesitter/nvim-treesitter', 
  build =  ':TSUpdate',
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = {"lua", "javascript", "scala", "python"},
      highlight = {enabled = true},
      indent = {enabled = true},
    })
  end
}
