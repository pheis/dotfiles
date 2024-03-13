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
  { 'folke/which-key.nvim', opts = {} },
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      on_attach = function(bufnr)
        vim.keymap.set('n', '[c', require('gitsigns').prev_hunk, { buffer = bufnr, desc = '[G]o to [P]revious Hunk' })
        vim.keymap.set('n', ']c', require('gitsigns').next_hunk, { buffer = bufnr, desc = '[G]o to [N]ext Hunk' })
        vim.keymap.set('n', '<leader>ph', require('gitsigns').preview_hunk, { buffer = bufnr, desc = '[P]review [H]unk' })
        -- TODO setup undo?
        -- vim.keymap.set('n', 'gu', require('gitsigns').undo_stage_hunk, { buffer = bufnr, desc = 'Undo hunk' })
      end,
    },
  },
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
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = '|',
        section_separators = '',
      },
    },
  },
  {
    'pwntester/octo.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require "octo".setup()
    end
  },
  'numToStr/Comment.nvim',
  {
    "preservim/vimux",
    config = function()
      -- TODO: drop nnoremaps
      vim.cmd([[
        nnoremap <leader>vp :VimuxPromptCommand<CR>
        nnoremap <leader>vl :VimuxRunLastCommand<CR>
        ]])
    end,
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
