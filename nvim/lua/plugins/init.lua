return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

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
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    config = function()
      require("plugins.configs.null_ls")
    end
  },

  -- Whichkey
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      require("plugins.configs.whichkey")
    end,
  },

  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
  },

  -- Snippets
  {
    'rafamadriz/friendly-snippets',
    config = function()
      require("plugins.configs.snippets")
    end,
  },

  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    config = function()
      -- pcall(require('nvim-treesitter.install').update { with_sync = true })
      require("plugins.configs.treesitter")
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    }
  },

  -- Git related plugins
  'tpope/vim-fugitive',
  'rhysd/conflict-marker.vim',
  'rhysd/git-messenger.vim',
  {
    'lewis6991/gitsigns.nvim',
    event = "VeryLazy",
    config = function()
      require("plugins.configs.gitsigns")
    end,
  },
  {
    "goolord/alpha-nvim",
    config = function()
      require("plugins.configs.alpha")
    end,
  },
  {
    'sindrets/diffview.nvim',
    event = "VeryLazy",
    dependencies = {
      'nvim-lua/plenary.nvim',
    }
  },
  -- Improve editor experience
  {
    'nvim-lualine/lualine.nvim', -- Fancier statusline
    config = function()
      require("plugins.configs.lualine")
    end,
  },
  {
    'lukas-reineke/indent-blankline.nvim', -- Add indentation guides even on blank lines
    event = "BufReadPre",                  -- Fix weird ass blue color for tabs!
    config = function()
      require("plugins.configs.blankline")
    end,
  },
  -- Comment stuff
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup({})
    end,
  },
  -- 'tpope/vim-sleuth',    -- Detect tabstop and shiftwidth automatically
  'luochen1990/rainbow', -- Add rainbow color for parenthesis
  -- Surround words with: "({[
  {
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup({})
    end,
  },
  {
    'nvim-tree/nvim-tree.lua', -- File tree
    config = function()
      require("plugins.configs.nvim_tree")
    end,
  },
  'nvim-tree/nvim-web-devicons', -- Add fancy icons
  {
    'ggandor/leap.nvim',         -- Improve navigation in file
    config = function()
      require("plugins.configs.leap")
    end,
  },
  {
    "folke/trouble.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("plugins.configs.trouble")
    end,
  },
  -- Improve folds!
  {
    'kevinhwang91/nvim-ufo',
    dependencies = 'kevinhwang91/promise-async',
    config = function()
      require("plugins.configs.ufo")
    end,
  },

  -- Telescope
  {
    'nvim-telescope/telescope.nvim',
    branch = 'master',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require("plugins.configs.telescope")
    end,
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build =
    'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
  },
  {
    "benfowler/telescope-luasnip.nvim",
  },

  -- Improve CSS development experience
  'ap/vim-css-color',

  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000, -- This avoids having the blue color for the indent-blankline plugin
    config = function()
      require("plugins.configs.catppuccin")
    end,
  },

  "norcalli/nvim-colorizer.lua",

  -- Advance Search and Replace
  {
    'windwp/nvim-spectre',
    event = "VeryLazy",
    config = function()
      require("plugins.configs.spectre_configs")
    end,
  },

  -- Allow to execute things like colcon/cmake
  'skywind3000/asyncrun.vim', -- Makes the makeprg to run asynchronously

  -- Restore cursor place
  {
    'ethanholz/nvim-lastplace',
    config = function()
      require("plugins.configs.nvim_lastplace")
    end,
  },

  -- docstring
  {
    "danymat/neogen",
    event = "VeryLazy",
    config = function()
      require('neogen').setup {}
    end,
    dependencies = "nvim-treesitter/nvim-treesitter",
  },

  -- Markdown
  {
    "iamcco/markdown-preview.nvim",
    event = "VeryLazy",
    build = function() vim.fn["mkdp#util#install"]() end,
    config = function()
      require("plugins.configs.markdown")
    end,
  },

  -- Fancy TODOs/FIXMEs
  -- Lua
  {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("plugins.configs.todos")
    end,
  },

  -- Debuggers
  {
  'mfussenegger/nvim-dap',
    config = function()
      require("plugins.configs.dap_configs")
    end,
  },
  'mfussenegger/nvim-dap-python',
  'rcarriga/nvim-dap-ui',
  'theHamsta/nvim-dap-virtual-text',

  {
    'simrat39/rust-tools.nvim',
    config = function()
      require("plugins.configs.rust_tools_config")
    end,
  },

  {
    'declancm/maximize.nvim',
    config = function()
      require("maximize").setup()
    end
  },

  {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup({})
    end,
  },

  -- Improve tabs
  {
    'romgrk/barbar.nvim',
    event = "BufEnter",
    dependencies = "nvim-tree/nvim-web-devicons",
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {},
    lazy = true,
  },
  -- Improve handling neovim terminals
  {
    "akinsho/toggleterm.nvim",
    config = function ()
      require("plugins.configs.toggleterm")
    end
  }
}
