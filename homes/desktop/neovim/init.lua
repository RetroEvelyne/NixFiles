-- Basic vim config
require('basics')
require('keymaps')
require('colours')

-- Packages
return require('packer').startup(function(use)
  -- Neovim package manager
  use 'wbthomason/packer.nvim'

  -- Atom's One Dark theme
  use 'navarasu/onedark.nvim'

  -- Gruvbox theme
  use 'ellisonleao/gruvbox.nvim'

  -- VSCode theme
  use 'Mofiqul/vscode.nvim'

  -- Everforest theme
  use 'sainnhe/everforest'

  -- Smooth scrolling
  use 'psliwka/vim-smoothie'

  -- Comments in any language
  use 'tpope/vim-commentary'

  -- Surrounding
  use 'tpope/vim-surround'

  -- Repeating
  use 'tpope/vim-repeat'

  -- Vim-wiki
  use 'vimwiki/vimwiki'

  -- Rainbow brackets
  use 'p00f/nvim-ts-rainbow'

  -- Git bindings
  use 'tpope/vim-fugitive'

  -- Latex
  use 'lervag/vimtex'

  -- Easy alignment
  use 'junegunn/vim-easy-align'


  -- Transparent background
  use {
    'xiyaowong/nvim-transparent',
    config = function()
      vim.g.transparent_enabled = false
    end
  }

  -- Zen mode
  use {
    "folke/zen-mode.nvim",
    config = function()
      require('zen-mode').setup()
    end
  }

  -- Autosaving
  use {
    'pocco81/auto-save.nvim',
    config = function()
      require('auto-save').setup({
        enabled = true,
        execution_message = {
          message = function()
            return ('>w< autosaved at ' .. vim.fn.strftime('%H:%M:%S'))
          end,
          cleaning_interval = 1250
        },
        trigger_events = { 'InsertLeave', 'TextChanged' }
      })
    end
  }

  -- Git signs
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }

  -- Github Copilot
  use {
    'zbirenbaum/copilot.lua',
    event = { 'VimEnter' },
    config = function()
      vim.defer_fn(function()
        require('copilot').setup()
      end, 100)
    end
  }

  -- Liveshare
  use {
    'jbyuki/instant.nvim',
    config = function()
      vim.g.instant_username = "Maddie"
    end
  }

  -- Fuzzy finder
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  }

  -- Auto-pairs
  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
    end
  }

  -- Highlight whitespaces
	use {
    'ntpeters/vim-better-whitespace',
    config = function()
      vim.g.better_whitespace_filetypes_blacklist = { 'startify' }
    end
  }

  -- Highlight indents
	use {
    'nathanaelkane/vim-indent-guides',
    config = function()
      vim.g.indent_guides_enable_on_vim_startup = 1
      vim.g.indent_guides_exclude_filetypes = { 'help', 'NvimTree', 'startify' }
    end
  }

  -- Color hex codes
  use {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end
  }

  -- Statusbar line
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require('lualine').setup()
    end
  }

  -- File browser
  use {
    'kyazdani42/nvim-tree.lua',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require('nvim-tree').setup()
    end
  }

  -- Org-mode
  use {
    'nvim-orgmode/orgmode',
    config = function()
      require('orgmode').setup()
      require('orgmode').setup_ts_grammar()
    end
  }

  -- Speedup neovim startup
  use {
    'lewis6991/impatient.nvim',
    config = function()
      require('impatient')
    end
  }

  -- Rust tools
  use 'neovim/nvim-lspconfig'
  use {
    'simrat39/rust-tools.nvim',
    config = function()
      require('rust-tools').setup()
    end
  }


  -- -- Language Server Protocol
  -- use {
  --   'neovim/nvim-lspconfig',
  --   config = function()
  --     require('lspconfig').pyright.setup{}
  --     require('lspconfig').rnix.setup{}
  --     require('lspconfig').bashls.setup{}
  --     require('lspconfig').vimls.setup{}
  --     require('lspconfig').sumneko_lua.setup {
  --       settings = {
  --         Lua = {
  --           diagnostics = {
  --             globals = { 'vim' }
  --           }
  --         }
  --       }
  --     }
  --   end
  -- }

  -- Code completion
  use 'L3MON4D3/LuaSnip'
  use 'rafamadriz/friendly-snippets'
  use 'zbirenbaum/copilot-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use {
    'hrsh7th/nvim-cmp',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require('plugins.cmp')
    end
  }

  -- Treesitter for highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = { 'cpp', 'lua', 'go', 'rust', 'python', 'nix', 'vim', 'markdown', 'html', 'css' },
        sync_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        rainbow = {
          enable = true,
          extended_mode = true
        },
        indent = {
          enable = true;
        }
      }
    end
  }
end)
