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
				"htmx",
				"htmx-lsp",
				"pyright-langserver",
			},
			automatic_installation = true, -- not the same as ensure_installed
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
				"elixirls",
				"bright_script",
				"pyright",
			},
			-- auto-install configured servers (with lspconfig)
			automatic_installation = true, -- not the same as ensure_installed
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"ruff", -- python linter
				"eslint_d", -- js linter
			},
		})

		vim.api.nvim_command("MasonToolsInstall")
	end,
}
