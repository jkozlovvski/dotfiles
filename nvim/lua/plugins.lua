vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)

  use 'wbthomason/packer.nvim'
	use 'nvim-treesitter/nvim-treesitter'

  -- tree-sitter config
	require'nvim-treesitter.configs'.setup {
		ensure_installed = { "c", "lua", "vim", "vimdoc", "query"},
		sync_install = false,
		auto_install = true,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
	}


  use 'neovim/nvim-lspconfig' -- configs for LSP servers
  use 'hrsh7th/cmp-nvim-lsp'
  use 'L3MON4D3/LuaSnip' -- snippets
  use 'hrsh7th/nvim-cmp' -- autocompletion 

  local function SetupLSP()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local lspconfig = require('lspconfig')

    -- autocomplete config
    local cmp = require('cmp')
    local cmp_select_opts = {behavior = cmp.SelectBehavior.Select}
    cmp.setup({
      sources = {
        {name = 'nvim_lsp'},
      },
      mapping = {
        ['<C-y>'] = cmp.mapping.confirm({select = true}),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<Up>'] = cmp.mapping.select_prev_item(cmp_select_opts),
        ['<Down>'] = cmp.mapping.select_next_item(cmp_select_opts),
        ['<C-p>'] = cmp.mapping(function()
          if cmp.visible() then
            cmp.select_prev_item(cmp_select_opts)
          else
            cmp.complete()
          end
        end),
        ['<C-n>'] = cmp.mapping(function()
          if cmp.visible() then
            cmp.select_next_item(cmp_select_opts)
          else
            cmp.complete()
          end
        end),
      },
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },
      window = {
        documentation = {
          max_height = 15,
          max_width = 60,
        }
      },
      formatting = {
        fields = {'abbr', 'menu', 'kind'},
        format = function(entry, item)
          local short_name = {
            nvim_lsp = 'LSP',
            nvim_lua = 'nvim'
          }

          local menu_name = short_name[entry.source.name] or entry.source.name
          item.menu = string.format('[%s]', menu_name)
          return item
        end,
      },
    })


    -- Adding capacilities supported by nvim-cmp
    for _, lsp in ipairs({'clangd', 'rust_analyzer', 'pylsp', 'lua_ls'}) do
      lspconfig[lsp].setup {
        capabilities = capabilities,
     }
    end

    -- python lsp setup, TODO: make it find pyproject or flake and then fallback for my default formatting
    -- https://github.com/python-lsp/python-lsp-server/blob/develop/CONFIGURATION.md
    lspconfig.pylsp.setup{
      settings = {
        pylsp = {
          plugins = {
            pycodestyle = {
              ignore = {'W391'},
              maxLineLength = 120
            }
          }
        }
      }
    }
  end

  SetupLSP()

  -- coloschemes
  use({ 'rose-pine/neovim', as = 'rose-pine' })
  use({ 'markvincze/panda-vim', as = 'panda' })
  use({ 'kaicataldo/material.vim', as = 'material' })
  use({ 'folke/tokyonight.nvim', as = 'tokyonight' })

  -- my current colorscheme
  vim.cmd('colorscheme material')

  use 'tpope/vim-commentary' -- easy commenting
  use 'tpope/vim-repeat' -- repeating plugin commands with '.'
  use 'tpope/vim-surround' -- surrounding text

  use 'nvim-tree/nvim-web-devicons'
  use 'ctrlpvim/ctrlp.vim' -- fuzzy finder 
  vim.g.ctrlp_clear_cache_on_exit = 0

  use 'nvim-lualine/lualine.nvim' -- fancy status bar
  require('lualine').setup({
    options = {
      theme = 'material',
      icons_enabled = true,
      component_separators = '|',
      section_separators = '',
      disabled_filetypes = {
        statusline = {'NvimTree'}
      }
    },
  })

  use 'pacha/vem-tabline' -- tabs
  -- Easy buffer switching
  vim.keymap.set('n', '<D-j>', '<Plug>vem_prev_buffer-')
  vim.keymap.set('n', '<D-k>', '<Plug>vem_next_buffer-')
  vim.keymap.set('t', '<D-j>', [[<C-\><C-n><Plug>vem_prev_buffer-]])
  vim.keymap.set('t', '<D-k>', [[<C-\><C-n><Plug>vem_next_buffer-]])

  -- Easy buffer repositioning
  vim.keymap.set('n', '<D-C-j>', '<Plug>vem_move_buffer_left-')
  vim.keymap.set('n', '<D-C-k>', '<Plug>vem_move_buffer_right-')

  -- <D-c> to close buffer
  use 'moll/vim-bbye' -- close buffer without closing window
  vim.keymap.set('n', '<D-c>', '<cmd>Bdelete!<CR>')
end)
