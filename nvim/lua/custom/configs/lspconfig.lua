local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- local util = require("lspconfig/util")
-- local cmp_nvim_lsp = require("cmp_nvim_lsp")
-- local opts = { noremap = true, silent = true }

local venv_path = os.getenv "VIRTUAL_ENV"
local py_path = nil
-- decide which python executable to use for mypy
if venv_path ~= nil then
  py_path = venv_path .. "/bin/python3"
else
  py_path = vim.g.python3_host_prog
end

local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- configure html server
lspconfig["html"].setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

-- configure typescript server with plugin
lspconfig["tsserver"].setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

-- configure css server
lspconfig["cssls"].setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

-- configure tailwindcss server
lspconfig["tailwindcss"].setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

-- configure svelte server
lspconfig["svelte"].setup {
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
}

-- configure prisma orm server
lspconfig["prismals"].setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

-- configure graphql language server
lspconfig["graphql"].setup {
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
}

-- configure emmet language server
lspconfig["emmet_ls"].setup {
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
}

-- configure python server
lspconfig["pyright"].setup {
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "python" },
}

-- configure lua server (with special settings)
lspconfig["lua_ls"].setup {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.stdpath "config" .. "/lua"] = true,
        },
      },
    },
  },
}

lspconfig["clangd"].setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

lspconfig["eslint"].setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

lspconfig["rust_analyzer"].setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

lspconfig["pylsp"].setup {
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
}

lspconfig["clojure_lsp"].setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

lspconfig["bashls"].setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

lspconfig["elixirls"].setup {
  cmd = { "elixir-ls" },
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig["erlangls"].setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

lspconfig["dartls"].setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

lspconfig["dockerls"].setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

lspconfig["docker_compose_language_service"].setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

lspconfig["jsonls"].setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

lspconfig["ocamlls"].setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

lspconfig["ocamllsp"].setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

lspconfig["gopls"].setup {
  capabilities = capabilities,
  on_attach = on_attach,
}
