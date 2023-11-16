local overrides = require("custom.configs.overrides")

local plugins = {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"jose-elias-alvarez/null-ls.nvim",
				config = function()
					require("custom.configs.null-ls")
				end,
			},
		},
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end,
	},

	{
		"williamboman/mason.nvim",
		opts = overrides.mason,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = overrides.treesitter,
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = overrides.nvimtree,
	},

	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		config = function()
			require("better_escape").setup()
		end,
	},

	{
		"andythigpen/nvim-coverage",
		lazy = false,
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("coverage").setup()
		end,
	},

	{
		"ThePrimeagen/vim-be-good",
		lazy = false,
	},

	{
		"kdheepak/lazygit.nvim",
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},

	{
		"nvim-treesitter/nvim-treesitter-context",
		lazy = false,
	},

	{
		"MunifTanjim/prettier.nvim",
		lazy = false,
		config = function()
			require("custom.configs.prettier")
		end,
	},

	{
		"mg979/vim-visual-multi",
		lazy = false,
	},

	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			style = "storm",
		},
	},

	{
		"neomake/neomake",
		lazy = false,
	},

	{
		"olexsmir/gopher.nvim",
		ft = "go",
		config = function(_, opts)
			require("gopher").setup(opts)
		end,
		build = function()
			vim.cmd([[silent! GoInstallDeps]])
		end,
	},

	{
		"nvimdev/lspsaga.nvim",
		event = "LspAttach",
		config = function()
			require("lspsaga").setup({})
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
	},

	{
		"tpope/vim-fugitive",
		lazy = false,
	},

	{
		"mbbill/undotree",
		lazy = false,
	},
	{
		"Exafunction/codeium.vim",
		event = "BufEnter",
	},
	{
		"kevinhwang91/nvim-bqf",
		ft = "qf",
		config = function()
			require("bqf").setup({
				preview = {
					winblend = 0,
				},
			})
		end,
	},
	{
		"junegunn/fzf",
		build = function()
			vim.fn["fzf#install"]()
		end,
		lazy = false,
	},

	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
	},

	{
		"digitaltoad/vim-pug",
		ft = "pug",
	},

	-- To make a plugin not be loaded
	-- {
	--   "NvChad/nvim-colorizer.lua",
	--   enabled = false
	-- },

	-- All NvChad plugins are lazy-loaded by default
	-- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
	-- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
}

return plugins
