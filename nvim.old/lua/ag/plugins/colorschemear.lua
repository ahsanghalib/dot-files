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
		-- config = function()
		-- 	vim.cmd.colorscheme("tokyonight-night")
		-- end,
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
		lazy = false,
		priority = 1000,
		config = function()
			require("github-theme").setup({})
			vim.cmd("colorscheme github_dark_tritanopia")
		end,
	},

	{
		"EdenEast/nightfox.nvim",
		priority = 1000,
		-- config = function()
		-- 	require("nightfox").setup({})
		-- 	vim.cmd("colorscheme nightfox")
		-- end,
	},
	{
		"ntk148v/habamax.nvim",
		priority = 1000,
		dependencies = { "rktjmp/lush.nvim" },
		-- config = function()
		-- 	vim.cmd([[colorscheme habamax.nvim]])
		-- end,
	},
}
