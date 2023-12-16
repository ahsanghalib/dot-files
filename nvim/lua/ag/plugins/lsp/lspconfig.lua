local venv_path = os.getenv("VIRTUAL_ENV")
local py_path = nil
-- decide which python executable to use for mypy
if venv_path ~= nil then
	py_path = venv_path .. "/bin/python3"
else
	py_path = vim.g.python3_host_prog
end

return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		-- import lspconfig plugin
		local lspconfig = require("lspconfig")

		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local keymap = vim.keymap -- for conciseness

		local opts = { noremap = true, silent = true }
		local on_attach = function(client, bufnr)
			opts.buffer = bufnr

			-- set keybinds
			opts.desc = "Show LSP references"
			keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

			opts.desc = "Go to declaration"
			keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

			opts.desc = "Show LSP definitions"
			keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

			opts.desc = "Show LSP implementations"
			keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

			opts.desc = "Show LSP type definitions"
			keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

			opts.desc = "See available code actions"
			keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

			opts.desc = "Smart rename"
			keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

			opts.desc = "Show buffer diagnostics"
			keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

			opts.desc = "Show line diagnostics"
			keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

			opts.desc = "Go to previous diagnostic"
			keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

			opts.desc = "Go to next diagnostic"
			keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

			opts.desc = "Show documentation for what is under cursor"
			keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

			opts.desc = "Restart LSP"
			keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary

			-- if client.name == "tsserver" then
			-- 	vim.keymap.set(
			-- 		"n",
			-- 		"<leader>lo",
			-- 		"<cmd>TSToolsOrganizeImports<cr>",
			-- 		{ buffer = bufnr, desc = "Organize Imports" }
			-- 	)
			-- 	vim.keymap.set(
			-- 		"n",
			-- 		"<leader>lO",
			-- 		"<cmd>TSToolsSortImports<cr>",
			-- 		{ buffer = bufnr, desc = "Sort Imports" }
			-- 	)
			-- 	vim.keymap.set(
			-- 		"n",
			-- 		"<leader>lu",
			-- 		"<cmd>TSToolsRemoveUnused<cr>",
			-- 		{ buffer = bufnr, desc = "Removed Unused" }
			-- 	)
			-- 	vim.keymap.set(
			-- 		"n",
			-- 		"<leader>lz",
			-- 		"<cmd>TSToolsGoToSourceDefinition<cr>",
			-- 		{ buffer = bufnr, desc = "Go To Source Definition" }
			-- 	)
			-- 	vim.keymap.set(
			-- 		"n",
			-- 		"<leader>lR",
			-- 		"<cmd>TSToolsRemoveUnusedImports<cr>",
			-- 		{ buffer = bufnr, desc = "Removed Unused Imports" }
			-- 	)
			-- 	vim.keymap.set("n", "<leader>lF", "<cmd>TSToolsFixAll<cr>", { buffer = bufnr, desc = "Fix All" })
			-- 	vim.keymap.set(
			-- 		"n",
			-- 		"<leader>lA",
			-- 		"<cmd>TSToolsAddMissingImports<cr>",
			-- 		{ buffer = bufnr, desc = "Add Missing Imports" }
			-- 	)
			-- end
		end

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Change the Diagnostic symbols in the sign column (gutter)
		-- (not in youtube nvim video)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		-- configure html server
		lspconfig["html"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure typescript server with plugin
		lspconfig["tsserver"].setup({
			capabilities = capabilities,
			on_attach = on_attach,

			settings = {
				diagnostics = { ignoredCodes = { 71007 } },
			},
		})

		-- configure css server
		lspconfig["cssls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure brightscript server
		lspconfig["bright_script"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure tailwindcss server
		lspconfig["tailwindcss"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure astro server
		lspconfig["astro"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure svelte server
		lspconfig["svelte"].setup({
			capabilities = capabilities,
			on_attach = function(client, bufnr)
				on_attach(client, bufnr)

				vim.api.nvim_create_autocmd("BufWritePost", {
					pattern = { "*.js", "*.ts" },
					callback = function(ctx)
						if client.name == "svelte" then
							client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
						end
					end,
				})
			end,
		})

		-- configure prisma orm server
		lspconfig["prismals"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		-- configure graphql language server
		lspconfig["graphql"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
		})

		-- configure emmet language server
		lspconfig["emmet_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
		})

		-- configure python server
		lspconfig["pyright"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "python" },
		})

		-- configure lua server (with special settings)
		lspconfig["lua_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = { -- custom settings for lua
				Lua = {
					-- make the language server recognize "vim" global
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						-- make language server aware of runtime files
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})

		lspconfig["clangd"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["eslint"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["rust_analyzer"].setup({

			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["pylsp"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				pylsp = {
					plugins = {
						-- formatter options
						black = { enabled = true },
						autopep8 = { enabled = false },
						yapf = { enabled = false },
						-- linter options
						pylint = { enabled = true, executable = "pylint" },
						ruff = { enabled = false },
						pyflakes = { enabled = false },
						pycodestyle = { enabled = false },
						-- type checker
						pylsp_mypy = {
							enabled = true,
							overrides = { "--python-executable", py_path, true },
							report_progress = true,
							live_mode = false,
						},
						-- auto-completion options
						jedi_completion = { fuzzy = true },
						-- import sorting
						isort = { enabled = true },
					},
				},
			},
			flags = {
				debounce_text_changes = 200,
			},
		})

		lspconfig["clojure_lsp"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["bashls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["elixirls"].setup({
			cmd = { "elixir-ls" },
			on_attach = on_attach,
			capabilities = capabilities,
		})

		lspconfig["erlangls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["dartls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["dockerls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["docker_compose_language_service"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["jsonls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["ocamlls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["ocamllsp"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})

		lspconfig["gopls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})
	end,
}
