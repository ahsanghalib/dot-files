return {
  {
    "bluz71/vim-nightfly-guicolors",
    priority = 1000, -- make sure to load this before all the other start plugins
    lazy = false,
    config = function()
      vim.cmd.colorscheme("nightfly")
    end,
  },

  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    -- config = function()
    --   vim.cmd.colorscheme("tokyonight-night")
    -- end,
  },

  {
    "morhetz/gruvbox",
    lazy = false,
    priority = 1000,
    -- config = function()
    --   vim.cmd.colorscheme("gruvbox")
    -- end,
  },

  {
    "ayu-theme/ayu-vim",
    lazy = false,
    priority = 1000,
    -- config = function()
    --   vim.cmd.colorscheme("ayu")
    -- end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,
    -- config = function()
    --   vim.cmd.colorscheme("catppuccin-mocha")
    -- end,
  },
}
