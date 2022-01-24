local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
	execute("packadd packer.nvim")
end

local plugins = {
	"wbthomason/packer.nvim",
	"justinmk/vim-dirvish",
	"tpope/vim-repeat",
	"tpope/vim-eunuch",
	"tpope/vim-rsi",
	"tpope/vim-abolish",
	"tpope/vim-surround",
	"tpope/vim-commentary",
	"tversteeg/registers.nvim",
	"jnurmine/Zenburn",
	"romainl/vim-qf",
	"terminalnode/sway-vim-syntax",
	"pearofducks/ansible-vim",
	{
		"nvim-treesitter/nvim-treesitter",
	},
	{
		"pangloss/vim-javascript",
		opt = true,
		ft = { "javascript", "typescript", "typescriptreact" },
	},
	{
		"MaxMEllon/vim-jsx-pretty",
		opt = true,
		ft = { "javascript", "typescript", "typescriptreact" },
	},
	{
		"HerringtonDarkholme/yats.vim",
		opt = true,
		ft = { "javascript", "typescript", "typescriptreact" },
	},
	{
		"mhinz/vim-startify",
		config = [[require'config.startify']],
	},
	{
		"junegunn/goyo.vim",
		config = "vim.cmd[[nnoremap <leader>o :Goyo<CR>]]",
	},
	{
		"tpope/vim-fugitive",
		config = [[require'config.fugitive']],
	},
	{
		"preservim/vimux",
		config = [[require'config.vimux']],
	},
	{
		"nvim-telescope/telescope.nvim",
		requires = { "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim" },
		config = [[require'config.telescope']],
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = [[require'colorizer'.setup()]],
	},
	-- lsp?
	{
		"neovim/nvim-lspconfig",
		config = [[require'config.lsp']],
	},
	-- extra lsp like stuff
	{
		"jose-elias-alvarez/null-ls.nvim",
		config = [[require'config.null-ls']],
	},
	{
		"jose-elias-alvarez/nvim-lsp-ts-utils",
		requires = { { "nvim-lua/plenary.nvim" } },
	},
	-- completion
	{
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			-- vsnip
			"hrsh7th/cmp-vsnip",
			"hrsh7th/vim-vsnip",
			"rafamadriz/friendly-snippets",
		},
		config = [[require'config.cmp']],
	},
	{
		"kosayoda/nvim-lightbulb",
		config = [[require'config.nvim-lightbulb']],
	},
	{
		"mhinz/vim-grepper",
	},
	{ "lewis6991/gitsigns.nvim", config = [[require'config.gitsigns']] },
	{
		"hoob3rt/lualine.nvim",
		requires = {
			"kyazdani42/nvim-web-devicons",
			opt = true,
		},
		config = [[require'config.lualine']],
	},
	{
		"ellisonleao/gruvbox.nvim", -- colortheme
		requires = { "rktjmp/lush.nvim" },
		config = [[require'config.gruvbox']],
	},
	{
		"nvim-pack/nvim-spectre",
		requires = { { "nvim-lua/plenary.nvim" } },
		config = [[require'config.spectre']],
	},
	{ "michaelb/sniprun", run = "bash ./install.sh", config = [[require'config.sniprun']] },
	{ "meain/vim-printer", config = [[require'config.vim-printer']] },
}

return require("packer").startup(function(use)
	for _, v in ipairs(plugins) do
		use(v)
	end
end)
