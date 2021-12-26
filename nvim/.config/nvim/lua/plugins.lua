local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim ' ..
                install_path)
    execute 'packadd packer.nvim'
end

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'justinmk/vim-dirvish'

    use {
        'mhinz/vim-startify',
        config = [[require'config.startify']],
    }

    use {
        'junegunn/goyo.vim',
        config = 'vim.cmd[[nnoremap <leader>o :Goyo<CR>]]'
    }

    use 'tpope/vim-repeat'
    use 'tpope/vim-eunuch'
    use 'tpope/vim-rsi'
    use 'tpope/vim-abolish'
    use 'tpope/vim-surround'
    use 'tpope/vim-commentary'
    use {
        'tpope/vim-fugitive',
        config = [[require'config.fugitive']]
    }

    use {
      'preservim/vimux',
        config = [[require'config.vimux']],
    }

    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
        config = [[require'config.telescope']],
    }

    use {
        'norcalli/nvim-colorizer.lua',
        config = [[require'colorizer'.setup()]],
    }

    -- js/ts {
    use {
        'pangloss/vim-javascript',
        opt = true,
        ft = {'javascript', 'typescript', 'typescriptreact'}
    }
    use {
        'MaxMEllon/vim-jsx-pretty',
        opt = true,
        ft = {'javascript', 'typescript', 'typescriptreact'}
    }
    use {
        'HerringtonDarkholme/yats.vim',
        opt = true,
        ft = {'javascript', 'typescript', 'typescriptreact'}
    }


    -- lsp?
     use {
       'neovim/nvim-lspconfig',
       config = [[require'config.lsp']]
    }
    -- completion
     use {
       'hrsh7th/nvim-cmp',
       requires = {
          'hrsh7th/cmp-nvim-lsp',
          'hrsh7th/cmp-buffer',
          'hrsh7th/cmp-path',
          'hrsh7th/cmp-cmdline',
          -- vsnip
          'hrsh7th/cmp-vsnip',
          'hrsh7th/vim-vsnip',
          'rafamadriz/friendly-snippets'
       },
       config = [[require'config.cmp']]
    }

    use {
        'mhinz/vim-grepper',
    }


    use "tversteeg/registers.nvim"

    use {
        'ellisonleao/glow.nvim',
        opt = true,
        ft = 'markdown',
        config = 'vim.cmd [[ nnoremap <leader>p :Glow<CR> ]]'
    }

    use {
        'mhinz/vim-signify',
        config = [[require'config.signify']]
    }

    use {
      'hoob3rt/lualine.nvim',
      requires = {
        'kyazdani42/nvim-web-devicons',
        opt = true,
      },
      config = [[require'config.lualine']]
    }

    -- colorthemes
    use {
        "ellisonleao/gruvbox.nvim",
        requires = {"rktjmp/lush.nvim"},
        config = [[require'config.gruvbox']],
    }
    use 'jnurmine/Zenburn'

    -- quicfix fix
    use 'romainl/vim-qf'

    -- special syntaxes
    use 'terminalnode/sway-vim-syntax'
    use 'pearofducks/ansible-vim'
end)
