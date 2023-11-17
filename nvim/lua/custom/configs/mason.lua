local mason = require "mason"

local mason_lspconfig = require "mason-lspconfig"

local mason_tool_installer = require "mason-tool-installer"

mason.setup {
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
  },
}

mason_lspconfig.setup {
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
  },
  automatic_installation = true,
}

mason_tool_installer.setup {
  ensure_installed = {
    "prettier",
    "stylua",
    "pylint",
    "black",
    "mypy",
    "ruff",
    "eslint_d", -- js linter
  },
}
