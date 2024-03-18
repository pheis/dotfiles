return {
	"ellisonleao/gruvbox.nvim",
	config = function()
		require("gruvbox").setup({})

		vim.cmd("colo gruvbox")
	end,
}
