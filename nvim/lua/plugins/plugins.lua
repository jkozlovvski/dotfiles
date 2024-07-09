return {
  -- Colorschemes
  {
    'rose-pine/neovim', 
    config = function()
      vim.cmd('colorscheme rose-pine')
    end
  },
  { 'markvincze/panda-vim', name = 'panda' },
  { 'kaicataldo/material.vim', name = 'material' },
  { 'folke/tokyonight.nvim', name = 'tokyonight' },

  -- Core plugins
  'nvim-treesitter/nvim-treesitter',
  'neovim/nvim-lspconfig',
  'hrsh7th/cmp-nvim-lsp',
  'L3MON4D3/LuaSnip',
  'hrsh7th/nvim-cmp',

  -- Additional utilities
  'tpope/vim-commentary',
  'tpope/vim-repeat',
  'tpope/vim-surround',
  'nvim-tree/nvim-web-devicons',
  'ctrlpvim/ctrlp.vim',
  { 'nvim-lualine/lualine.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' } },
  'pacha/vem-tabline',
  'moll/vim-bbye',
  'scalameta/nvim-metals',

  -- Configuration
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      }
    end
  },

  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'L3MON4D3/LuaSnip',
      'hrsh7th/nvim-cmp'
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require('lspconfig')

      -- Autocomplete config
      local cmp = require('cmp')
      local cmp_select_opts = {behavior = cmp.SelectBehavior.Select}
      cmp.setup({
        -- ... (rest of your cmp setup)
      })

      -- LSP setup
      for _, lsp in ipairs({'clangd', 'rust_analyzer', 'pylsp', 'lua_ls'}) do
        lspconfig[lsp].setup {
          capabilities = capabilities,
        }
      end

      -- Python LSP setup
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
  },

  {
    'nvim-lualine/lualine.nvim',
    config = function()
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
    end
  },

  -- Keymaps and other configurations
  {
    'pacha/vem-tabline',
    config = function()
      vim.keymap.set('n', '<D-j>', '<Plug>vem_prev_buffer-')
      vim.keymap.set('n', '<D-k>', '<Plug>vem_next_buffer-')
      vim.keymap.set('t', '<D-j>', [[<C-\><C-n><Plug>vem_prev_buffer-]])
      vim.keymap.set('t', '<D-k>', [[<C-\><C-n><Plug>vem_next_buffer-]])
      vim.keymap.set('n', '<D-C-j>', '<Plug>vem_move_buffer_left-')
      vim.keymap.set('n', '<D-C-k>', '<Plug>vem_move_buffer_right-')
    end
  },

  {
    'moll/vim-bbye',
    config = function()
      vim.keymap.set('n', '<D-c>', '<cmd>Bdelete!<CR>')
    end
  },

  {
    'ctrlpvim/ctrlp.vim',
    config = function()
      vim.g.ctrlp_clear_cache_on_exit = 0
    end
  },


  -- nvim-metals
  -- from https://github.com/folke/lazy.nvim/discussions/767#discussioncomment-5891862
  {
    "scalameta/nvim-metals",
    name = "metals",
    ft = { "scala", "sbt", "java" },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- stylua: ignore
    keys = {
      { "<leader>cW", function () require('metals').hover_worksheet() end, desc = "Metals Worksheet" },
      { "<leader>cM", function () require('telescope').extensions.metals.commands() end, desc = "Telescope Metals Commands" },
    },
    config = function()
      local metals_config = require("metals").bare_config()

      metals_config.settings = {
        showImplicitArguments = true,
        showImplicitConversionsAndClasses = true,
        showInferredType = true,
        superMethodLensesEnabled = true,
      }
      metals_config.init_options.statusBarProvider = "on"
      metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()

      local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "scala", "sbt", "java" },
        callback = function()
          require("metals").initialize_or_attach(metals_config)
        end,
        group = nvim_metals_group,
      })
    end,
  }
}
