require('lazy').setup({
  -- TODO: replace with neo-tree
  "justinmk/vim-dirvish",
  "tpope/vim-repeat",
  "tpope/vim-eunuch",
  "tpope/vim-rsi",
  "tpope/vim-abolish",
  "tpope/vim-surround",
  "tpope/vim-unimpaired",
  -- is this needed? Makes quicklist nicer but are there better alternatives?
  "romainl/vim-qf",
  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',
  require 'plugins.cmp',
  require 'plugins.lsp',
  require 'plugins.treesitter',
  require 'plugins.telescope',
  require 'plugins.neo-tree',
  require 'plugins.gitsigns',
  require 'plugins.lualine',
  require 'plugins.vimux',
  'numToStr/Comment.nvim',
  { 'folke/which-key.nvim', opts = {} },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  -- colors
  "rebelot/kanagawa.nvim",
  "shaunsingh/solarized.nvim",
  {
    'rose-pine/neovim',
    name = 'rose-pine'
  },
  {
    "ellisonleao/gruvbox.nvim",
    config = function() require("gruvbox").setup({}) end
  },
  "sindrets/diffview.nvim",
  {
    'mrcjkb/haskell-tools.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    version = '^2', -- Recommended
    ft = { 'haskell', 'lhaskell', 'cabal', 'cabalproject' },
  }
}, {})
