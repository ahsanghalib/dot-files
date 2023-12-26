return {
	{
		"bluz71/vim-nightfly-guicolors",
		priority = 1000, -- make sure to load this before all the other start plugins
		-- config = function()
		-- 	vim.cmd([[colorscheme nightfly]])
		-- end,
	},
	{
		"folke/tokyonight.nvim",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("tokyonight-night")
		end,
	},
	{
		"morhetz/gruvbox",
		priority = 1000,
		-- config = function()
		--   vim.cmd.colorscheme("gruvbox")
		-- end,
	},
	{
		"ayu-theme/ayu-vim",
		priority = 1000,
		-- config = function()
		--   vim.cmd.colorscheme("ayu")
		-- end,
	},
	{
		"catppuccin/nvim",
		priority = 1000,
		-- config = function()
		-- 	vim.cmd.colorscheme("catppuccin")
		-- end,
	},
	{
		"projekt0n/github-nvim-theme",
		priority = 1000,
		-- config = function()
		-- require("github-nvim-theme").setup({})
		-- 	vim.cmd("colorscheme github_dark_high_default")
		-- end,
	},

	{
		"EdenEast/nightfox.nvim",
		priority = 1000,
		-- config = function()
		-- 	require("nightfox").setup({})
		-- 	vim.cmd("colorscheme nightfox")
		-- end,
	},
}
