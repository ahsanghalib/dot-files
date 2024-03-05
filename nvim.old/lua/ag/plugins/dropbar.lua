return {
	"Bekaboo/dropbar.nvim",
	lazy = false,
	dependencies = {
		"nvim-telescope/telescope-fzf-native.nvim",
	},
	config = function()
		require("dropbar").setup({})
		vim.ui.select = require("dropbar.utils.menu").select

		vim.keymap.set("n", "<leader>b", "<cmd>lua require('dropbar.api').pick()<cr>", { desc = "Select breadcrums" })
	end,
}
