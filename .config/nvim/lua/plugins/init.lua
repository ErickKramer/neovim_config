return {
  -- INFO: Git related plugins
  'tpope/vim-fugitive',        -- Git wrapper for vim
  'rhysd/conflict-marker.vim', -- weapon to fight against merge conflicts
  'rhysd/git-messenger.vim',   -- Shows commit message under cursor
  {
    'lewis6991/gitsigns.nvim', -- Similar to fugitive, but adds additional functionality
    event = "VeryLazy",
    config = function()
      require("plugins.configs.gitsigns")
    end,
  },
  {
    'sindrets/diffview.nvim', -- Single tabpage interface for easily cycling through diffs
    event = "VeryLazy",
    dependencies = {
      'nvim-lua/plenary.nvim',
    }
  },
  -- INFO: Enhance Editor Experience
  'mg979/vim-visual-multi',      -- Enable multicursor
  'luochen1990/rainbow',         -- Add rainbow color for parenthesis
  'nvim-tree/nvim-web-devicons', -- Add fancy icons
  'skywind3000/asyncrun.vim',    -- Makes the makeprg to run asynchronously
  {
    "catppuccin/nvim",
    name = "catppuccin", -- Color theme
    lazy = false,
    priority = 1000,     -- This avoids having the blue color for the indent-blankline plugin
    config = function()
      require("plugins.configs.catppuccin")
    end,
  },
  {
    'nvim-tree/nvim-tree.lua', -- File tree
    config = function()
      require("plugins.configs.nvim_tree")
    end,
  },
  {
    "iamcco/markdown-preview.nvim", -- Markdown previewer
    -- event = "VeryLazy",
    build = function() vim.fn["mkdp#util#install"]() end,
    config = function()
      require("plugins.configs.markdown")
    end,
  },
  {
    "folke/todo-comments.nvim", -- Fancy TODOs/FIXMEs
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("plugins.configs.todos")
    end,
  },
  {
    'ggandor/leap.nvim', -- Improve navigation in file
    config = function()
      require('leap').add_default_mappings()
    end,
  },
  {
    "folke/trouble.nvim", -- Quickfix list for LSP errors
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("plugins.configs.trouble")
    end,
  },
  {
    "folke/which-key.nvim", -- Popup with possible keybindings of the command you started to type
    event = "VeryLazy",
    -- opts = {}
    config = function()
      require("which-key").setup {
        window = {
          border = "rounded"
        }
      }
    end,
  },
  {
    "goolord/alpha-nvim", -- Greeter dashboard
    config = function()
      require("plugins.configs.alpha")
    end,
  },
  {
    'nvim-lualine/lualine.nvim', -- Fancier statusline
    config = function()
      require("plugins.configs.lualine")
    end,
  },
  {
    'lukas-reineke/indent-blankline.nvim', -- Add indentation guides even on blank lines
    main = "ibl",
    config = function()
      require("plugins.configs.blankline")
    end,
  },
  {
    "numToStr/Comment.nvim", -- Comment stuff
    opts = {}
  },
  {
    'declancm/maximize.nvim', -- Maximize split
    opts = {}
  },
  {
    'windwp/nvim-autopairs', -- Autopair plugin that support multiple characters
    opts = {}
  },
  {
    "kylechui/nvim-surround", -- Surround words with: "({[
    opts = {}
  },
  {
    'kevinhwang91/nvim-ufo', -- Improve folds!
    dependencies = 'kevinhwang91/promise-async',
    config = function()
      require("plugins.configs.ufo")
    end,
  },
  {
    'nvim-pack/nvim-spectre', -- Advance Search and Replace
    event = "VeryLazy",
    config = function()
      require("plugins.configs.spectre_configs")
    end,
  },
  {
    'ethanholz/nvim-lastplace', -- Restore cursor place
    config = function()
      require("plugins.configs.nvim_lastplace")
    end,
  },
  {
    "norcalli/nvim-colorizer.lua", -- Color highlighter
    lazy = true,
    opts = {}
  },
  {
    'romgrk/barbar.nvim', -- Tabline plugin that improves buffers and tabs
    event = "BufEnter",
    dependencies = "nvim-tree/nvim-web-devicons",
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {},
    lazy = true,
  },
  {
    "akinsho/toggleterm.nvim", -- Improve handling neovim terminals
    config = function()
      require("plugins.configs.toggleterm")
    end
  },
  {
    "cappyzawa/trim.nvim", -- Remove trailing spaces
    config = function()
      require("plugins.configs.trim")
    end
  },
  {
    "danymat/neogen", -- docstring
    event = "VeryLazy",
    dependencies = "nvim-treesitter/nvim-treesitter",
    opts = {},
  },
  -- Telescope related plugins
  -- this is a great extension to improve searching experience
  {
    'nvim-telescope/telescope.nvim',
    -- branch = 'master',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      -- Fuzzy Finder Algorithm which requires local dependencies to be built.
      -- Only load if `make` is available. Make sure you have the system
      -- requirements installed.
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      "benfowler/telescope-luasnip.nvim", -- Allows to search the available snippets
      "nvim-telescope/telescope-live-grep-args.nvim" -- Enable passing arguments to ripgrep
    },
    config = function()
      require("plugins.configs.telescope")
    end,
  },
  --
  -- INFO: LSP Related plugins
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',

      -- Additional lua configuration, makes nvim stuff amazing
      'folke/neodev.nvim',
    },
  },
  {
    "j-hui/fidget.nvim",
    config = function()
      -- require('fidget').setup {}
      require("plugins.configs.fidget")
    end,
    tag = 'legacy', -- Add legacy tag until fidget.nvim is migrated!
  },
  {
    "jose-elias-alvarez/null-ls.nvim", -- Useful plugin for configuring linter and formatters
    event = "VeryLazy",
    config = function()
      require("plugins.configs.null_ls")
    end
  },
  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',

      'hrsh7th/cmp-nvim-lsp', -- Adds LSP completion capabilities

      'hrsh7th/cmp-path',     -- Add source filesystem path
    },
  },

  {
    'rafamadriz/friendly-snippets', -- Snippets collection
    config = function()
      require("plugins.configs.snippets")
    end,
  },

  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require("plugins.configs.treesitter")
    end,
    build = ':TSUpdate',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    }
  },
  -- Allow to execute things like colcon/cmake

  -- INFO: Debuggers
  'mfussenegger/nvim-dap-python',
  'rcarriga/nvim-dap-ui',
  'theHamsta/nvim-dap-virtual-text',
  {
    'mfussenegger/nvim-dap',
    config = function()
      require("plugins.configs.dap_configs")
    end,
  },

  {
    'simrat39/rust-tools.nvim',
    config = function()
      require("plugins.configs.rust_tools_config")
    end,
  },
}
