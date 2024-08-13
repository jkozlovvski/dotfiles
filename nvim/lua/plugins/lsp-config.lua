require('lspconfig').pyright.setup{
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "basic"
      }
    }
  }
}

require'lspconfig'.metals.setup{}
