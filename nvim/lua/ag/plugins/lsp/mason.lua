return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
			ensure_installed = {
				"typescript-language-server",
				"js-debug-adapter",
				"delve",
				"gotests",
				"golangci-lint",
				"gofumpt",
				"goimports",
				"golangci-lint-langserver",
				"impl",
				"gomodifytags",
				"iferr",
				"gotestsum",
				"sonarlint-language-server",
				"elixirls",
				"bright_script",
				"pyright",
				"ruff",
				"mypy",
				"htmx",
			},
		})

		mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = {
				"tsserver",
				"html",
				"cssls",
				"tailwindcss",
				"svelte",
				"lua_ls",
				"graphql",
				"emmet_ls",
				"prismals",
				"pyright",
				"elixirls",
				"bright_script",
			},
			-- auto-install configured servers (with lspconfig)
			automatic_installation = true, -- not the same as ensure_installed
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"pylint", -- python linter
				"black",
				"mypy",
				"ruff",
				"eslint_d", -- js linter
			},
		})
	end,
}
