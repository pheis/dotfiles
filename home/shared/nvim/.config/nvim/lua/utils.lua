return {
  "tpope/vim-rsi",
  "tpope/vim-surround",
  "tpope/vim-fugitive",
  "tpope/vim-repeat",
  "tpope/vim-abolish",
  { -- comment hl via TS
    "dariuscorvus/tree-sitter-language-injection.nvim",
    opts = {}, -- calls setup()
  },
  -- themes
  "shaunsingh/solarized.nvim",
  "sjl/badwolf",
  "webhooked/kanso.nvim",
  "webhooked/kanso.nvim",
  "rebelot/kanagawa.nvim",
  "catppuccin/nvim",
  {
    "ellisonleao/gruvbox.nvim",
    config = true,
  },

  -- nvim lua config
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
}
