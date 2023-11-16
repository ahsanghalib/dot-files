local present, null_ls = pcall(require, "null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

if not present then
	return
end

local b = null_ls.builtins

local sources = {
	b.formatting.deno_fmt,
	-- b.formatting.prettier.with({ filetypes = { "html", "markdown", "css", "ts", "tsx", "js", "jsx", "json", "yaml" } }), -- so prettier works only on these filetypes
	b.formatting.prettierd, -- npm install -g @fsouza/prettierd
	b.formatting.stylua,
	b.formatting.clang_format,
	b.formatting.gofumpt, -- go install mvdan.cc/gofumpt@latest
	b.formatting.goimports_reviser, -- go install -v github.com/incu6us/goimports-reviser/v3@latest
	b.formatting.golines, -- go install github.com/segmentio/golines@latest
}

null_ls.setup({
	debug = true,
	sources = sources,
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({
				group = augroup,
				buffer = bufnr,
			})
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
			})
		end
	end,
})
