return {
	"catppuccin/nvim",
	lazy = false,
	name = "catppuccin",
	priority = 1000,
	config = function()
		vim.cmd("set background=dark")
	--	vim.cmd.colorscheme "catppuccin-mocha"
	end
}
